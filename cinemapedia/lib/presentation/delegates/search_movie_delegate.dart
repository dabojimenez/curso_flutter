import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate<Movie?> {
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
    return const Text('Build suggestions');
  }
}
