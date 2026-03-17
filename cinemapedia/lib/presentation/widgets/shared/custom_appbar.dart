import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../screens/providers/providers.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity, // todo el anchoq ue se pueda
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text('Cinemapedia', style: titleStyle),
              // Spacer: es como un espacio flexible que ocupa todo el espacio restante
              Spacer(),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // final movieRepository = ref.read(movieRepositoryProvider);
                  // showSearch: muestra un buscador en pantalla completa

                  // final searchNotifier = ref.read(searchMoviesProvider.notifier);
                  final searchQuery = ref.read(searchQueryProvider);
                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context,
                    // delegate: el encargado de manejar la logica del buscador y esta relacionado a la capa de presentacion
                    delegate: SearchMovieDelegate(
                      initialMovies: ref.read(searchMoviesProvider),
                      // Mandamos la referencia a la funcion
                      searchMovies: ref
                          .read(searchMoviesProvider.notifier)
                          .searchMoviesByQuery,
                    ),
                  ).then((movie) {
                    if (movie == null) return;
                    context.push('/movie/${movie.id}');
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
