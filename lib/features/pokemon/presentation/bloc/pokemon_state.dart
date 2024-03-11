part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();
}

class PokemonInitialState extends PokemonState {
  @override
  List<Object> get props => [];
}

class PokemonErrorState extends PokemonState {
  @override
  List<Object> get props => [];
}

class PokemonLoadingState extends PokemonState {
  @override
  List<Object> get props => [];
}

class ShowCurrentPokemonState extends PokemonState {
  final PokemonEntity pokemon;
  const ShowCurrentPokemonState({
    required this.pokemon,
  });
  @override
  List<Object> get props => [pokemon];
}

class CatchPokemonState extends PokemonState {
  const CatchPokemonState();
  @override
  List<Object> get props => [];
}

class ReleasePokemonState extends PokemonState {

  const ReleasePokemonState();
  @override
  List<Object> get props => [];
}
