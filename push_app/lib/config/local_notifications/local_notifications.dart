import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  // Metodo para pedir permisos, de las local notifications
  static Future<void> requestPermissionLocalNotifications() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  static Future<void> initializeLocalNotifications() async {
    // con este plugin, podemos mostrar notificaciones locales, programar notificaciones, etc
    //, sin necesidad de usar push notifications, y ademas, es compatible con Android e iOS,
    //y nos permite personalizar las notificaciones, como por ejemplo, agregar una imagen, un sonido personalizado, etc.
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    // Inicializacion de Andorid
    // AndroidInitializationSettings: nos permite configurar la inicializacion de las
    // notificaciones locales en Android, y ademas, nos permite configurar el icono de la notificacion, el canal de la notificacion, etc.
    const initializationSettingsAndroid = AndroidInitializationSettings(
      'app_icon',
    );

    // TODO: IOS CONFIGURATION

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      // TODO: IOS CONFIGURATION
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      // TODO
      // onDidReceiveBackgroundNotificationResponse:
    );
  }

  static void showLocalNotification({
    required int id,
    required String? title,
    required String? body,
    required String? data,
  }) {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      playSound: true,
      sound: RawResourceAndroidNotificationSound(
        'notification',
      ), // usamos el arhivo de sonido que agregamos en android/app/src/main/res/raw/notification.mp3
      importance: Importance.max,
      priority: Priority.high,
    );

    //
    const notificationDetails = NotificationDetails(
      android: androidDetails,
      // TODO: IOS CONFIGURATION
    );

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: notificationDetails,
      payload:
          data, // el payload es la data que queremos enviar a la pantalla de detalles, para mostrarla en esa pantalla, o para hacer alguna logica con esa data, como por ejemplo, redirigir a una pantalla especifica, etc.
    );
  }
}
