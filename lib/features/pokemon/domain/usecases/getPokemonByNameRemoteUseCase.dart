import 'package:pokedex/core/dio/data_state.dart';
import 'package:pokedex/core/usecase/usecase.dart';
import 'package:pokedex/features/pokemon/domain/entities/PokemonEntity.dart';
import 'package:pokedex/features/pokemon/domain/repositories/pokemon_repository.dart';

class GetPokemonByNameRemoteUseCase
    implements UseCase<DataState<PokemonEntity>, GetPokemonByNameParams> {
  final PokemonRepository _pokemonRepository;

  GetPokemonByNameRemoteUseCase(this._pokemonRepository);
  @override
  Future<DataState<PokemonEntity>> call(
      {required GetPokemonByNameParams params}) async {
    final response =
        await _pokemonRepository.getPokemonByNameRemote(params.name);
    return response;
  }
}

class GetPokemonByNameParams {
  final String name;

  const GetPokemonByNameParams({
    required this.name,
  });
}
