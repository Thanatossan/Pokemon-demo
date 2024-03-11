import 'package:pokedex/features/pokemon/data/datasources/local/entity/pokemon_entity.dart';
import 'package:pokedex/features/pokemon/domain/entities/PokemonEntity.dart';

extension PokemonLocalEntityExtension on PokemonLocalEntity {
  PokemonEntity toPokemonEntity() {
    return PokemonEntity(id: id, name: name, sprite: sprite);
  }
}
