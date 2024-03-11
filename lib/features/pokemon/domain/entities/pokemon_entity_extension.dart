import 'package:pokedex/features/pokemon/data/datasources/local/entity/pokemon_entity.dart';

import 'PokemonEntity.dart';

extension PokemonEntityExtension on PokemonEntity {
  PokemonLocalEntity toPokemonLocalEntity() {
    return PokemonLocalEntity(id, name, sprite);
  }
}
