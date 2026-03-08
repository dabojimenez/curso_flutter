import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// provider de solo lectura, y su objetivo es proporcionar la informacion necesaria, para consultar la implementacion de MoviesRepository
final movieRepositoryProvider = Provider( (ref) {
  return MovieRepositoryImpl(MovieDbDataSource());
});