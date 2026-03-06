import 'package:cinemapedia/domain/entities/movie.dart';

// Aqui es donde llamamos al datasource, para no llamarlo directamente
abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
