import 'package:cinemapedia/config/database/database.dart';
import 'package:cinemapedia/config/router/app_router.dart';
import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  // Aseguramos que Flutter esté inicializado antes de ejecutar cualquier código asincrónico
  WidgetsFlutterBinding.ensureInitialized();

  // await db
  //     .into(db.favoriteMovies)
  //     .insert(
  //       // FavoriteMoviesCompanion: en cierta parte o forma, nos ayuda con ciertas seguridades y el id autoincrementable
  //       FavoriteMoviesCompanion.insert(
  //         movieId: 1,
  //         backdropPath: 'path/to/backdrop.png',
  //         originalTitle: 'Mi priemra pelicula',
  //         posterPath: 'path/to/poster.png',
  //         title: 'Mi primera inserción',
  //       ),
  //     );

  // // creamos el query de borrado
  // final deleteQuery = db.delete(db.favoriteMovies);
  // // ejecutamos el query de borrado
  // await deleteQuery.go();

  // // movies: es una consulta que se hace a la base de datos para obtener los datos de la tabla favoriteMovies
  // final movies = await db.select(db.favoriteMovies).get();
  // print(movies);
  // Hacemos asincrono al main y cargamos el archivo .env
  await dotenv.load(fileName: ".env");
  runApp(
    // ProviderScope es el widget que contiene a todos los providers
    const ProviderScope(child: MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}

final db = AppDatabase();
