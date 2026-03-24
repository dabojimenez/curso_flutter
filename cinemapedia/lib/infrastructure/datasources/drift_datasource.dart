import 'package:cinemapedia/config/database/database.dart';
import 'package:cinemapedia/domain/datasource/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/main.dart';
import 'package:drift/drift.dart' as drift;

class DriftDatasource extends LocalStorageDatasource {
  final AppDatabase database;

  DriftDatasource([AppDatabase? database])
    : database =
          database ??
          db; // si no se le pasa una instancia de AppDatabase, se usará la instancia global 'db' definida en main.dart

  @override
  Future<bool> isFavoriteMovie(int movieId) async {
    // construir el query
    final query = database.select(database.favoriteMovies)
      ..where((tabla) => tabla.movieId.equals(movieId));
    // ejecutar el query
    final favoriteMovie = await query.getSingleOrNull();
    // retornar el resultado
    return favoriteMovie != null;
  }

  @override
  Future<List<Movie>> loadFavoriteMovies({int limite = 10, int offset = 0}) {
    // TODO: implement loadFavoriteMovies
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavoriteMovie(Movie movie) async {
    final isFavorite = await isFavoriteMovie(movie.id);
    if (isFavorite) {
      final deleteQuery = database.delete(database.favoriteMovies)
        ..where((tabla) => tabla.movieId.equals(movie.id));
      await deleteQuery.go();
      return;
    } else {
      await database
          .into(database.favoriteMovies)
          .insert(
            FavoriteMoviesCompanion.insert(
              movieId: movie.id,
              backdropPath: movie.backdropPath,
              originalTitle: movie.originalTitle,
              posterPath: movie.posterPath,
              title: movie.title,
              // drift.Value: podemos castear el valor a un tipo específico, en este caso a double, para evitar problemas de tipo de datos al insertar en la base de datos
              voteAverage: drift.Value(movie.voteAverage),
            ),
          );
    }
  }
}
