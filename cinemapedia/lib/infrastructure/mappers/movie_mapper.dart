import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
        : 'https://th.bing.com/th/id/OIP.Lr_j_PgqTGzKxJTeIwajVwHaLH?w=204&h=306&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
        : 'https://content.numetro.co.za/ui_images/no_poster.png',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );

  static Movie movieDetailsToEntity(MovieDetails movieDetails) => Movie(
    adult: movieDetails.adult,
    backdropPath: (movieDetails.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieDetails.backdropPath}'
        : 'https://th.bing.com/th/id/OIP.Lr_j_PgqTGzKxJTeIwajVwHaLH?w=204&h=306&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    genreIds: movieDetails.genres.map((e) => e.name.toString()).toList(),
    id: movieDetails.id,
    originalLanguage: movieDetails.originalLanguage,
    originalTitle: movieDetails.originalTitle,
    overview: movieDetails.overview,
    popularity: movieDetails.popularity,
    posterPath: (movieDetails.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}'
        : 'https://th.bing.com/th/id/OIP.Lr_j_PgqTGzKxJTeIwajVwHaLH?w=204&h=306&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    releaseDate: movieDetails.releaseDate,
    title: movieDetails.title,
    video: movieDetails.video,
    voteAverage: movieDetails.voteAverage,
    voteCount: movieDetails.voteCount,
  );
}
