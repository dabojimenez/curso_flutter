import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_app/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationsBloc() : super(const NotificationsState()) {
    // on<NotificationsEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    // Manejador de eventos
    on<NotificationStatusChanged>(_notificationStatusChange);

    // // Aqui dejamos, en caso de que se desea cargar la solicitud de permisos, al iniciar la aplicacion
    // requestPermission();

    _initialStatusCheck();
  }

  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(settings.authorizationStatus));
    _getFCMToken();
  }

  void _getFCMToken() async {
    // final settings = await messaging.getNotificationSettings();
    // si no esta autorizado, no hacer nada
    if (state.status != AuthorizationStatus.authorized) return;
    // if (settings.authorizationStatus != AuthorizationStatus.authorized) return;

    final token = await messaging.getToken();
    print('FCM Token: $token');
  }

  // Inicializa Firebase Cloud Messaging
  static Future<void> initializeFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _notificationStatusChange(
    NotificationStatusChanged event,
    Emitter<NotificationsState> emit,
  ) {
    emit(state.copyWith(status: event.status));
    _getFCMToken();
  }

  // Metodo que nos permitira obtener el permiso
  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true, // crea una medalliitra en la aplicacion
      carPlay: false, // si el dispositivo esta conectado a un auto
      criticalAlert: false, // notificaciones criticas o  si son muy urgentes
      provisional: false, // permiso provisional
      sound: true,
    );

    add(NotificationStatusChanged(settings.authorizationStatus));
  }
}
