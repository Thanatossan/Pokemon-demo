import 'package:pokedex/core/dio/data_state.dart';
import 'package:pokedex/core/usecase/usecase.dart';
import 'package:pokedex/features/pokemon/domain/entities/PokemonEntity.dart';
import 'package:pokedex/features/pokemon/domain/repositories/pokemon_repository.dart';

class LoadPokemonLocalUseCase
    implements UseCase<DataState<List<PokemonEntity>>, void> {
  final PokemonRepository _pokemonRepository;

  LoadPokemonLocalUseCase(this._pokemonRepository);
  @override
  Future<DataState<List<PokemonEntity>>> call({required void params}) async {
    final response = await _pokemonRepository.getPokemonAllLocal();
    return response;
  }
}
