import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_app/config/local_notifications/local_notifications.dart';
import 'package:push_app/domain/entities/push_message.dart';
import 'package:push_app/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  // TODO: AQUI PODRIAMOS HACER EL GUARDADO DE LA NOTIFICACION PUSH EN UNA BASE DE DATOS LOCAL, PARA LUEGO MOSTRARLA CUANDO EL USUARIO ABRA LA APLICACION
  print('Handling a background message: ${message.messageId}');
}

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationsBloc() : super(const NotificationsState()) {
    // Manejador de eventos
    on<NotificationStatusChanged>(_notificationStatusChange);

    on<NotificationRecived>(_onPushMessageRecived);
    // // Aqui dejamos, en caso de que se desea cargar la solicitud de permisos, al iniciar la aplicacion
    // requestPermission();
    _initialStatusCheck();

    // Escuchar mensajes en primer plano (listeener para notificaciones en foreground)
    _onForegroundMessage();
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

    // final token = await messaging.getToken();
    // print('FCM Token: $token');
  }

  void handleRemoteMessage(RemoteMessage message) {
    if (message.notification == null) return;

    final notification = PushMessage(
      messageId:
          message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '',
      title: message.notification!.title ?? '',
      body: message.notification!.body ?? '',
      sentDate: message.sentTime ?? DateTime.now(),
      data: message.data,
      imageUrl: Platform.isAndroid
          ? message.notification!.android?.imageUrl
          : message.notification!.apple?.imageUrl,
    );

    // Agregamos la notificacion recibida al estado, para luego mostrarla en la
    // UI, y ademas, esto nos permite tener un historial de las notificaciones recibidas,
    // aunque la aplicacion este cerrada, ya que el estado se mantiene aunque la aplicacion este cerrada, y
    // ademas, nos permite mostrar las notificaciones recibidas en una pantalla de historial de notificaciones, por ejemplo.
    LocalNotifications.showLocalNotification(
      id: notification.messageId.hashCode,
      title: notification.title,
      body: notification.body,
      data: notification.data.toString(),
    );

    add(NotificationRecived(notification));
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
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

  void _onPushMessageRecived(
    NotificationRecived event,
    Emitter<NotificationsState> emit,
  ) {
    emit(
      state.copyWith(
        notifications: [event.pushMessage, ...state.notifications],
      ),
    );
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

    // No muy necesario, si ya usamo las pushnotifications
    // Solicitar permiso a las local notifications, para que el usuario pueda recibir notificaciones locales programadas, aunque no sean push notifications
    await LocalNotifications.requestPermissionLocalNotifications();

    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  // Metodo que nos servira para verificar si existe o no una notificacion pushh y regresa un PushMessage opcional
  PushMessage? getMessageById(String messageId) {
    final exist = state.notifications.any((msg) => msg.messageId == messageId);
    if (!exist) return null;

    return state.notifications.firstWhere((msg) => msg.messageId == messageId);
  }
}
