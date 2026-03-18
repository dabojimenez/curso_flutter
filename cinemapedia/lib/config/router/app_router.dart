import 'package:cinemapedia/presentation/screens/movies/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      // page: para identificar cual pagina desea mostrar
      path: '/home/:page',
      name: 'home',
      builder: (context, state) {
        // Otenemos el index de la ruta
        int pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        if (pageIndex > 2 || pageIndex < 0) {
          pageIndex = 0;
        }
        return HomeScreen(pageIndex: pageIndex);
      },
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

    // Aqui redirigimos la ruta inicial a la ruta home con el index 0
    GoRoute(
      path: '/',
      // con _ o __ indicamos que no neceistamos el context y el state, respectivamente
      redirect: (_, __) => '/home/0',
    ),
  ],
);
