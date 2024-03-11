import 'package:pokedex/core/dio/data_state.dart';
import 'package:pokedex/core/usecase/usecase.dart';
import 'package:pokedex/features/pokemon/domain/repositories/pokemon_repository.dart';

class DeletePokemonByIdLocalUseCase
    implements UseCase<DataState<void>, DeletePokemonByIdParams> {
  final PokemonRepository _pokemonRepository;

  DeletePokemonByIdLocalUseCase(this._pokemonRepository);
  @override
  Future<DataState<void>> call(
      {required DeletePokemonByIdParams params}) async {
    final response = await _pokemonRepository.deletePokemonLocalById(params.id);
    return response;
  }
}

class DeletePokemonByIdParams {
  final int id;

  const DeletePokemonByIdParams({
    required this.id,
  });
}
