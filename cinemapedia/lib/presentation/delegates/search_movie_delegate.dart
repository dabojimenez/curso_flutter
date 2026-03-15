import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

// typedef: es una forma de crear un alias para un tipo de funcion
typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  // funcion que nos permitira hacer la busqueda de peliculas
  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({required this.searchMovies});

  // para cambiar el placeholder de 'Search' a 'Buscar pelicula'
  @override
  String get searchFieldLabel => 'Buscar pelicula';

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
        // regresamos null, ya que no seleccionamos ninguna pelicula
        close(context, null);
      },
    );
  }

  // Nos permite cosntruir los resultados de la busqueda, al presionar enter
  @override
  Widget buildResults(BuildContext context) {
    return const Text('Build results');
  }

  // Nos permite cosntruir las sugerencias de la busqueda, mientras escribimos
  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      // ejecutamos basado en el query
      future: searchMovies(query),
      initialData: const [],
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              title: Text(movie.title),
              subtitle: Text(movie.originalTitle),
            );
          },
        );
      },
    );
  }
}
