import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/config/local_notifications/local_notifications.dart';
import 'package:push_app/config/router/app_router.dart';
import 'package:push_app/config/theme/app_theme.dart';
import 'package:push_app/presentation/blocs/notifications/notifications_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // establecemos el handler para las notificaciones en background
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificationsBloc.initializeFCM();
  // Inicializamos las notificaciones locales, para poder mostrar notificaciones
  // locales, programar notificaciones, etc, sin necesidad de usar push notifications
  await LocalNotifications.initializeLocalNotifications();

  runApp(
    // MultiBlocProvider: permite proveer multiples blocs a la aplicacion, y en este caso, lo haremos con la notificacion
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => NotificationsBloc())],
      child: const MainApp(),
    ),
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
      builder: (context, child) =>
          HanldeNotificationInteractions(child: child!),
    );
  }
}

// HanldeNotificationInteractions: nos sirve para mantenerlo separado y aislado de la logica de las notificaciones, y asi evitar que el MainApp se vuelva muy grande, y ademas, nos permite manejar las interacciones con las notificaciones, como por ejemplo, redirigir a la pantalla correspondiente cuando se recibe una notificacion, o cuando se hace click en una notificacion, etc.
class HanldeNotificationInteractions extends StatefulWidget {
  // el objetivo de este widget es escuchar las interacciones con las notificaciones, y redirigir a la pantalla correspondiente, para retornarlo
  final Widget child;
  const HanldeNotificationInteractions({super.key, required this.child});

  @override
  State<HanldeNotificationInteractions> createState() =>
      _HanldeNotificationInteractionsState();
}

class _HanldeNotificationInteractionsState
    extends State<HanldeNotificationInteractions> {
  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage = await FirebaseMessaging.instance
        .getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    context.read<NotificationsBloc>().handleRemoteMessage(message);

    final messageId =
        message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '';
    appRouter.push('/push-details/$messageId');

    // if (message.data['type'] == 'chat') {
    //   Navigator.pushNamed(context, '/chat',
    //     arguments: ChatArguments(message),
    //   );
    // }
  }

  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
