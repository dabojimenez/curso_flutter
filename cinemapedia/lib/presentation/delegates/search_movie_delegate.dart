import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate {
  // para cambiar el placeholder de 'Search' a 'Buscar pelicula'
  @override
  String get searchFieldLabel => 'Buscar pelicula';

  // Nos pemrite cosntruir las acciones
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [const Text('Build actions')];
  }

  // Nos permite cosntruir el widget que esta a la izquierda del buscador
  @override
  Widget? buildLeading(BuildContext context) {
    return const Text('Build leading');
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
