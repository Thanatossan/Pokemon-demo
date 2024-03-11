import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/PokemonModel.dart';

part 'pokemon_remote_datasource.g.dart';

@RestApi()
abstract class PokemonRemoteDataSource {
  factory PokemonRemoteDataSource(Dio dio) = _PokemonRemoteDataSource;

  @GET("/pokemon/{id}")
  Future<HttpResponse<PokemonModel>> getPokemonById(@Path("id") int id);

  @GET("/pokemon/{name}")
  Future<HttpResponse<PokemonModel>> getPokemonByName(
      @Path("name") String name);
}
