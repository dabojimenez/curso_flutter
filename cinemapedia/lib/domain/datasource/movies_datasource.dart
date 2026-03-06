import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
  // Definimos como luce los origenes de datos
  Future<List<Movie>> getNowPlaying({int page = 1});
}
