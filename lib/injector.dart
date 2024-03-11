import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/constant/variable.dart';
import 'package:pokedex/features/pokemon/data/datasources/remote/pokemon_remote_datasource.dart';
import 'package:pokedex/features/pokemon/domain/usecases/getPokemonByNameRemoteUseCase.dart';
import 'package:pokedex/features/pokemon/domain/usecases/insertPokemonLocalUseCase.dart';
import 'package:pokedex/features/pokemon/domain/usecases/loadPokemonLocalUseCase.dart';

import 'core/dio/dio_factory.dart';
import 'core/routes/router.dart';
import 'features/pokemon/data/datasources/local/dao/local_dao.dart';
import 'features/pokemon/data/datasources/local/database.dart';
import 'features/pokemon/data/repositories/pokemon_repositories_impl.dart';
import 'features/pokemon/domain/repositories/pokemon_repository.dart';
import 'features/pokemon/domain/usecases/deletePokemonbyIdLocalUseCase.dart';
import 'features/pokemon/domain/usecases/getPokemonByIdRemoteUseCase.dart';
import 'features/pokemon/presentation/bloc/pokemon_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<Dio>(DioFactory(endpointApi).create());
  injector.registerSingleton<GoRouter>(router);

  injector.registerSingletonAsync<AppDatabase>(
      () async => $FloorAppDatabase.databaseBuilder('demo.db').build());
  await GetIt.instance.isReady<AppDatabase>();
  // Datasources
  injector.registerSingleton<PokemonRemoteDataSource>(
      PokemonRemoteDataSource(injector()));
  injector.registerSingletonWithDependencies<PokemonLocalDataSource>(
      () => injector<AppDatabase>().pokemonDao,
      dependsOn: [AppDatabase]);
  await GetIt.instance.isReady<PokemonLocalDataSource>();
  // Repository
  injector.registerSingleton<PokemonRepository>(PokemonRepositoryImpl(
      remoteDataSource: injector(), localDataSource: injector()));

  // Use cases
  injector.registerSingleton<GetPokemonByNameRemoteUseCase>(
      GetPokemonByNameRemoteUseCase(injector()));
  injector.registerSingleton<GetPokemonByIdRemoteUseCase>(
      GetPokemonByIdRemoteUseCase(injector()));
  injector.registerSingleton<InsertPokemonLocalUseCase>(
      InsertPokemonLocalUseCase(injector()));
  injector.registerSingleton<LoadPokemonLocalUseCase>(
      LoadPokemonLocalUseCase(injector()));
  injector.registerSingleton<DeletePokemonByIdLocalUseCase>(
      DeletePokemonByIdLocalUseCase(injector()));

  //Bloc
  injector.registerFactory(() => PokemonBloc(
      getPokemonByNameRemoteUseCase: injector(),
      getPokemonByIdRemoteUseCase: injector(),
      loadPokemonLocalUseCase: injector(),
      insertPokemonLocalUseCase: injector(),
      deletePokemonByIdLocalUseCase: injector()));
}
