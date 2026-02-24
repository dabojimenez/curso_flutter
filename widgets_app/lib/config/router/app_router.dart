import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      // name: 'cards',
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      name: ProgressScreen.nameRoute,
      path: '/progress',
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      name: SnackbarScreen.nameRoute,
      path: '/snackbar',
      builder: (context, state) => const SnackbarScreen(),
    ),
    GoRoute(
      name: AnimatedScreen.nameRoute,
      path: '/animated_container',
      builder: (context, state) => const AnimatedScreen(),
    ),
  ],
);
