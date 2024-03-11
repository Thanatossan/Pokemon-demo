import 'dart:math';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/dio/data_state.dart';
import 'package:pokedex/features/pokemon/domain/entities/PokemonEntity.dart';
import 'package:pokedex/features/pokemon/domain/usecases/deletePokemonbyIdLocalUseCase.dart';
import 'package:pokedex/features/pokemon/domain/usecases/getPokemonByIdRemoteUseCase.dart';
import 'package:pokedex/features/pokemon/domain/usecases/getPokemonByNameRemoteUseCase.dart';
import 'package:pokedex/features/pokemon/domain/usecases/insertPokemonLocalUseCase.dart';
import 'package:pokedex/features/pokemon/domain/usecases/loadPokemonLocalUseCase.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemonByNameRemoteUseCase getPokemonByNameRemoteUseCase;
  final GetPokemonByIdRemoteUseCase getPokemonByIdRemoteUseCase;
  final LoadPokemonLocalUseCase loadPokemonLocalUseCase;
  final InsertPokemonLocalUseCase insertPokemonLocalUseCase;
  final DeletePokemonByIdLocalUseCase deletePokemonByIdLocalUseCase;

  PokemonEntity? currentPokemon;
  List<PokemonEntity> pokemons = [];
  PokemonBloc(
      {required this.getPokemonByNameRemoteUseCase,
      required this.getPokemonByIdRemoteUseCase,
      required this.loadPokemonLocalUseCase,
      required this.insertPokemonLocalUseCase,
      required this.deletePokemonByIdLocalUseCase})
      : super(PokemonInitialState()) {
    on<PokemonEvent>((event, emit) async {});
    on<GetAllPokemonLocal>((event, emit) async {
      emit(PokemonLoadingState());
      final response = await loadPokemonLocalUseCase(params: null);
      if (response is DataSuccess) {
        pokemons = response.data!;
      }
      emit(PokemonInitialState());
    });
    on<GetPokemonByName>((event, emit) async {
      try {
        emit(PokemonLoadingState());
        final response = await getPokemonByNameRemoteUseCase(
            params: GetPokemonByNameParams(name: event.name));
        if (response is DataSuccess) {
          emit(ShowCurrentPokemonState(pokemon: response.data!));
          currentPokemon = response.data;
        }
      } on DioException {
        emit(PokemonErrorState());
      }
    });

    on<GetPokemonById>((event, emit) async {
      try {
        emit(PokemonLoadingState());
        int randomNum = Random().nextInt(1000);
        final response = await getPokemonByIdRemoteUseCase(
            params: GetPokemonByIdParams(id: randomNum));
        if (response is DataSuccess) {
          emit(ShowCurrentPokemonState(pokemon: response.data!));
          currentPokemon = response.data;
        }
      } on DioException {
        emit(PokemonErrorState());
      }
    });

    on<CatchPokemon>((event, emit) {
      if (currentPokemon != null) {
        insertPokemonLocalUseCase(
            params: InsertPokemonLocalParams(pokemonEntity: currentPokemon!));
        pokemons.add(currentPokemon!);
        emit(const CatchPokemonState());
        currentPokemon = null;
      }
    });

    on<ReleasePokemonById>((event, emit) {
      emit(PokemonLoadingState());
      pokemons.removeWhere((element) => element.id == event.id);
      deletePokemonByIdLocalUseCase(
          params: DeletePokemonByIdParams(id: event.id));
      emit(const ReleasePokemonState());
    });
  }
}
