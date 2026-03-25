import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final stepUno = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final stepDos = ref.watch(popularMoviesProvider).isEmpty;
  final stepTres = ref.watch(topRatedMoviesProvider).isEmpty;
  final stepCuatro = ref.watch(upComingMoviesProvider).isEmpty;
  if (stepUno || stepDos || stepTres || stepCuatro) return true;
  return false;
});
