import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationsBloc() : super(const NotificationsState()) {
    // on<NotificationsEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
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

    print('Permiso concedido: ${settings.authorizationStatus}');
  }
}
