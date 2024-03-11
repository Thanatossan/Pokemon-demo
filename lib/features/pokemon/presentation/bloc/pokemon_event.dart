part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class GetAllPokemonLocal extends PokemonEvent {
  const GetAllPokemonLocal();
  @override
  List<Object> get props => [];
}

class GetPokemonByName extends PokemonEvent {
  final String name;

  const GetPokemonByName({
    required this.name,
  });
  @override
  List<Object> get props => [name];
}

class GetPokemonById extends PokemonEvent {
  const GetPokemonById();
  @override
  List<Object> get props => [];
}

class CatchPokemon extends PokemonEvent {
  final PokemonEntity pokemonEntity;

  const CatchPokemon({
    required this.pokemonEntity,
  });
  @override
  List<Object> get props => [pokemonEntity];
}

class ReleasePokemonById extends PokemonEvent {
  final int id;
  const ReleasePokemonById({
    required this.id,
  });

  @override
  List<Object?> get props => [];
}
