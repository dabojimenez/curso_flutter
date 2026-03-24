import 'package:cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavoriteMovie(Movie movie);
  Future<bool> isFavoriteMovie(int movieId);
  Future<List<Movie>> loadFavoriteMovies({
    int limite = 10,
    int offset =
        0, // offset: es el número de elementos que se deben omitir antes de comenzar a devolver los resultados. Es útil para la paginación, ya que permite cargar los datos en partes o "páginas" en lugar de cargar todo de una vez. Por ejemplo, si tienes una lista de 100 elementos y quieres mostrar solo 10 por página, puedes usar un offset de 10 para cargar la segunda página (elementos del 11 al 20), un offset de 20 para la tercera página (elementos del 21 al 30), y así sucesivamente.
  });
}
