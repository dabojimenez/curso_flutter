import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlideshow({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8, // deja ver el slide anterior o el que sigue (lo q sale a los lados)
        scale: 0.9, // escala el slide a un 90%
        autoplay: true,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _Slide(movie: movie);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Placeholder(
    );
  }
}