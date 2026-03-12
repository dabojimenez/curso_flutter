import 'package:cinemapedia/presentation/screens/movies/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      // routes: son las rutas hijas
      routes: [
        GoRoute(
          // :id => indicamos que le pasamos un argumento, en este caos el id
          path: 'movie/:id',
          name: MovieScreen.routeName,
          builder: (context, state) {
            // Obtenemos el id de la ruta
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        ),
      ],
    ),
  ],
);
