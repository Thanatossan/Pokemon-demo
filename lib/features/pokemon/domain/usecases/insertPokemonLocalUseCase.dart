import 'package:pokedex/core/dio/data_state.dart';
import 'package:pokedex/core/usecase/usecase.dart';
import 'package:pokedex/features/pokemon/domain/entities/PokemonEntity.dart';
import 'package:pokedex/features/pokemon/domain/repositories/pokemon_repository.dart';

class InsertPokemonLocalUseCase
    implements UseCase<DataState<void>, InsertPokemonLocalParams> {
  final PokemonRepository _pokemonRepository;

  InsertPokemonLocalUseCase(this._pokemonRepository);
  @override
  Future<DataState<void>> call(
      {required InsertPokemonLocalParams params}) async {
    final response =
        await _pokemonRepository.insertPokemonLocal(params.pokemonEntity);
    return response;
  }
}

class InsertPokemonLocalParams {
  final PokemonEntity pokemonEntity;
  InsertPokemonLocalParams({required this.pokemonEntity});
}
