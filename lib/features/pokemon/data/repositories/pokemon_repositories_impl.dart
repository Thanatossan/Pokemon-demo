import 'dart:io';

import 'package:pokedex/core/dio/data_state.dart';
import 'package:pokedex/features/pokemon/data/datasources/local/dao/local_dao.dart';
import 'package:pokedex/features/pokemon/data/datasources/local/entity/pokemon_entity_extension.dart';
import 'package:pokedex/features/pokemon/data/datasources/remote/pokemon_remote_datasource.dart';
import 'package:pokedex/features/pokemon/data/models/Pokemon_model_extension.dart';
import 'package:pokedex/features/pokemon/domain/entities/PokemonEntity.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_entity_extension.dart';
import 'package:pokedex/features/pokemon/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final PokemonLocalDataSource localDataSource;

  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<DataState<PokemonEntity>> getPokemonByNameRemote(String name) async {
    final response = await remoteDataSource.getPokemonByName(name);
    switch (response.response.statusCode) {
      case HttpStatus.ok:
        return DataSuccess(response.data.toPokemonEntity());
      default:
        return DataFailed(
            response.response.statusMessage, response.response.statusCode);
    }
  }

  @override
  Future<DataState<PokemonEntity>> getPokemonByIdRemote(int id) async {
    final response = await remoteDataSource.getPokemonById(id);
    switch (response.response.statusCode) {
      case HttpStatus.ok:
        return DataSuccess(response.data.toPokemonEntity());
      default:
        return DataFailed(
            response.response.statusMessage, response.response.statusCode);
    }
  }

  @override
  Future<DataState<List<PokemonEntity>>> getPokemonAllLocal() async {
    final response = await localDataSource.findAllPokemons();
    return DataSuccess(response.map((e) => e.toPokemonEntity()).toList());
  }

  @override
  Future<DataState<PokemonEntity>> getPokemonByIdLocal(int id) async {
    final response = await localDataSource.findPokemonById(id);
    return DataSuccess(response?.toPokemonEntity());
  }

  @override
  Future<DataState<void>> insertPokemonLocal(PokemonEntity pokemon) async {
    try {
      final response =
          await localDataSource.insertPokemon(pokemon.toPokemonLocalEntity());
      return DataSuccess(response);
    } catch (e) {
      return DataFailed(e.toString(), 500);
    }
  }

  @override
  Future<DataState<void>> updatePokemonLocal(PokemonEntity pokemon) async {
    try {
      final response =
          await localDataSource.updatePokemon(pokemon.toPokemonLocalEntity());
      return DataSuccess(response);
    } catch (e) {
      return DataFailed(e.toString(), 500);
    }
  }

  @override
  Future<DataState<void>> deletePokemonLocalById(int id) async {
    try {
      final response = await localDataSource.deletePokemonById(id);
      return DataSuccess(response);
    } catch (e) {
      return DataFailed(e.toString(), 500);
    }
  }
}
