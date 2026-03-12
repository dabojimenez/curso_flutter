import 'package:cinemapedia/domain/entities/movie.dart';

// Aqui es donde llamamos al datasource, para no llamarlo directamente
abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<List<Movie>> getUpComming({int page = 1});
}
