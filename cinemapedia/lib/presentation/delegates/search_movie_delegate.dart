import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

// typedef: es una forma de crear un alias para un tipo de funcion
typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  // funcion que nos permitira hacer la busqueda de peliculas
  final SearchMoviesCallback searchMovies;
  List<Movie> initialMovies;
  // StreamController: nos permitira manejar el flujo de datos
  // broadcast: nos permitira que varios oyentes se suscriban al stream
  StreamController<List<Movie>> debounceMovies = StreamController.broadcast();
  Timer? _debounceTimer;

  SearchMovieDelegate({required this.searchMovies, required this.initialMovies})
    : super(
        searchFieldLabel: 'Buscar pelicula',
        textInputAction: TextInputAction.done,
      );

  void _onQueryChanged(String query) {
    // limpiamos el timer si existe
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    // esperamos uns 500 milesimas de segundo, para esperar que el cliente no escriba
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      // if (query.isEmpty) {
      //   // si es vacio, retornamos peliculas vacias
      //   debounceMovies.add([]);
      //   return;
      // }
      // llamamos a la funcion de busqueda
      final movies = await searchMovies(query);
      // agregamos las peliculas al stream
      debounceMovies.add(movies);
      // esto hacemos, para que siempre tenga data y asi poder evitar el doble posteo, evitando llamar el fetch
      initialMovies = movies;
    });
  }

  void clearStreams() {
    debounceMovies.close();
  }

  // // para cambiar el placeholder de 'Search' a 'Buscar pelicula'
  // @override
  // String get searchFieldLabel => 'Buscar pelicula';

  // Nos pemrite cosntruir las acciones
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      // if (query.isNotEmpty)
      FadeIn(
        animate: query.isNotEmpty,
        duration: const Duration(milliseconds: 200),
        child: IconButton(
          onPressed: () {
            //query: propiedad propia de SearchDelegate que contiene el texto que se esta escribiendo
            // limpiamos el buscador o el query
            query = '';
          },
          icon: const Icon(Icons.clear),
        ),
      ),
    ];
  }

  // Nos permite cosntruir el widget que esta a la izquierda del buscador
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        clearStreams();
        // regresamos null, ya que no seleccionamos ninguna pelicula
        close(context, null);
      },
    );
  }

  // Nos permite cosntruir los resultados de la busqueda, al presionar enter
  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
      initialData: initialMovies,
      stream: debounceMovies.stream,
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return _MovieItem(
              movie: movie,
              onMovieSelected: (context, movie) {
                clearStreams();
                close(context, movie);
              },
            );
          },
        );
      },
    );
  }

  Widget builtResultsAndSuggestions() {}

  // Nos permite cosntruir las sugerencias de la busqueda, mientras escribimos
  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);

    return StreamBuilder(
      // // ejecutamos basado en el query
      // future: searchMovies(query),
      //
      stream: debounceMovies.stream,
      initialData: initialMovies,
      builder: (context, snapshot) {
        // ! print(snapshot.data);
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return _MovieItem(
              movie: movie,
              onMovieSelected: (context, movie) {
                clearStreams();
                close(context, movie);
              },
            );
          },
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;

  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        // cerramos el delegate y regresamos la pelicula seleccionada
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            // Imagen de la pelicula
            SizedBox(
              width: size.width * 0.2, // El 20 % del ancho de la pantalla
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                ),
              ),
            ),

            // separacion
            const SizedBox(width: 10),
            // Descripcion
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                children: [
                  Text(movie.title, style: textStyles.titleMedium),
                  (movie.overview.length > 100)
                      ? Text('${movie.overview.substring(0, 100)}...')
                      : Text(movie.overview),
                  Row(
                    children: [
                      Icon(
                        Icons.star_half_rounded,
                        color: Colors.yellow.shade800,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        HumanFormats.number(movie.voteAverage, 1),
                        style: textStyles.bodyMedium!.copyWith(
                          color: Colors.yellow.shade900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
