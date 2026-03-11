import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction:
            0.8, // deja ver el slide anterior o el que sigue (lo q sale a los lados)
        scale: 0.9, // escala el slide a un 90%
        autoplay: true,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 10),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary,
          ),
        ),
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
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: const Offset(0, 5), // x, y = 0,5
        ),
      ],
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black12),
                );
              }
              return FadeIn(child: child);
            },
          ),
        ),
      ),
    );
  }
}
