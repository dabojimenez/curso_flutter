import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath: cast.profilePath != null
        ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
        : 'https://tse3.mm.bing.net/th/id/OIP.4XY_iKHs9Ztw4E9DWcNcDwHaHT?rs=1&pid=ImgDetMain&o=7&rm=3',
    character: cast.character,
  );
}
