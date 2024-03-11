import 'package:pokedex/core/dio/data_state.dart';
import 'package:pokedex/core/usecase/usecase.dart';
import 'package:pokedex/features/pokemon/domain/entities/PokemonEntity.dart';
import 'package:pokedex/features/pokemon/domain/repositories/pokemon_repository.dart';

class GetPokemonByIdRemoteUseCase
    implements UseCase<DataState<PokemonEntity>, GetPokemonByIdParams> {
  final PokemonRepository _pokemonRepository;

  GetPokemonByIdRemoteUseCase(this._pokemonRepository);
  @override
  Future<DataState<PokemonEntity>> call(
      {required GetPokemonByIdParams params}) async {
    final response = await _pokemonRepository.getPokemonByIdRemote(params.id);
    return response;
  }
}

class GetPokemonByIdParams {
  final int id;

  const GetPokemonByIdParams({
    required this.id,
  });
}
