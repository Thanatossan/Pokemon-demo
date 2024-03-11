import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/local_dao.dart';
import 'entity/pokemon_entity.dart';

part 'database.g.dart';

@Database(version: 1, entities: [PokemonLocalEntity])
abstract class AppDatabase extends FloorDatabase {
  PokemonLocalDataSource get pokemonDao;
}
