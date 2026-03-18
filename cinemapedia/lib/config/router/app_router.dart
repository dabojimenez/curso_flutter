import 'package:cinemapedia/presentation/screens/movies/screens.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      // definimos las rutas de tipo gouroute
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const HomeView();
          },
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
        GoRoute(
          path: '/favorites',
          builder: (context, state) {
            return const FavoritesView();
          },
        ),
      ],
    ),

    //// Rutas padre / hijo
    // GoRoute(
    //   path: '/',
    //   name: 'home',
    //   builder: (context, state) => const HomeScreen(childView: HomeView()),
    //   // routes: son las rutas hijas
    //   routes: [
    //     GoRoute(
    //       // :id => indicamos que le pasamos un argumento, en este caos el id
    //       path: 'movie/:id',
    //       name: MovieScreen.routeName,
    //       builder: (context, state) {
    //         // Obtenemos el id de la ruta
    //         final movieId = state.pathParameters['id'] ?? 'no-id';
    //         return MovieScreen(movieId: movieId);
    //       },
    //     ),
    //   ],
    // ),
  ],
);
