import 'package:floor/floor.dart';
import 'package:pokedex/features/pokemon/data/datasources/local/entity/pokemon_entity.dart';

@dao
abstract class PokemonLocalDataSource {
  @Query('SELECT * FROM PokemonLocalEntity')
  Future<List<PokemonLocalEntity>> findAllPokemons();

  @Query('SELECT * FROM PokemonLocalEntity WHERE id = :id')
  Future<PokemonLocalEntity?> findPokemonById(int id);

  @insert
  Future<void> insertPokemon(PokemonLocalEntity pokemon);

  @delete
  Future<void> deletePokemon(PokemonLocalEntity pokemon);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updatePokemon(PokemonLocalEntity pokemon);

  @Query('DELETE FROM PokemonLocalEntity WHERE id = :id')
  Future<void> deletePokemonById(int id);
}
