import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasource/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  List<Actor> _jsonToMovies(Map<String, dynamic> json) {
    final castResponse = CreditsResponse.fromJson(json);
    final List<Actor> actores = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actores;
  }

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    return _jsonToMovies(response.data);
  }
}
