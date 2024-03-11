import 'package:floor/floor.dart';

@entity
class PokemonLocalEntity {
  @primaryKey
  final int id;
  final String? name;
  final String? sprite;

  PokemonLocalEntity(
    this.id,
    this.name,
    this.sprite,
  );
}
