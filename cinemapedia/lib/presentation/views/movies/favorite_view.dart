import 'package:cinemapedia/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteView extends ConsumerStatefulWidget {
  const FavoriteView({super.key});

  @override
  ConsumerState<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends ConsumerState<FavoriteView> {
  @override
  void initState() {
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(favoriteMoviesProvider);
    final myMovieList = favoritesMovies.values.toList();

    return Scaffold(
      // appBar: AppBar(title: const Text('Favoritos view')),
      // body: ListView.builder(
      //   itemCount: favoritesMovies.keys.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     final movie = myMovieList[index];
      //     return ListTile(title: Text(movie.title));
      //   },
      // ),
      body: MoviesMasonry(movies: myMovieList),
    );
  }
}
