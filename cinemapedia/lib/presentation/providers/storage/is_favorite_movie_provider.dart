import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// family: indicamos que recibe un argumento
// bool, el valor bolenao que vamos a repsonder (en este caso)
// int, el valor que vamos a recibir (en este caso)
final isFavoriteMovieProvider = FutureProvider.family.autoDispose<bool, int>((
  ref,
  movieId,
) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return localStorageRepository.isFavoriteMovie(movieId);
});
