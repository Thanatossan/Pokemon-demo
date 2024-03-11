import 'package:pokedex/features/pokemon/domain/entities/PokemonEntity.dart';

import 'PokemonModel.dart';

extension PokemonModelExtension on PokemonModel {
  PokemonEntity toPokemonEntity() {
    return PokemonEntity(id: id, name: name, sprite: sprites?.frontDefault);
  }
}
