import 'package:pokedex/core/dio/data_state.dart';
import 'package:pokedex/features/pokemon/domain/entities/PokemonEntity.dart';

abstract class PokemonRepository {
  Future<DataState<PokemonEntity>> getPokemonByNameRemote(String name);

  Future<DataState<PokemonEntity>> getPokemonByIdRemote(int id);

  Future<DataState<List<PokemonEntity>>> getPokemonAllLocal();

  Future<DataState<PokemonEntity>> getPokemonByIdLocal(int id);

  Future<DataState<void>> insertPokemonLocal(PokemonEntity pokemon);

  Future<DataState<void>> deletePokemonLocalById(int id);

  Future<DataState<void>> updatePokemonLocal(PokemonEntity pokemon);
}
