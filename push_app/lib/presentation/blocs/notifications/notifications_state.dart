part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  final AuthorizationStatus status;
  // TODO: crear mi modelo de notificaciones
  final List<dynamic> notifications;

  const NotificationsState({
    // su estado inicial, sera no determinado
    this.status = AuthorizationStatus.notDetermined,
    // su lista inicial, sera vacia
    this.notifications = const [],
  });

  NotificationsState copyWith({
    AuthorizationStatus? status,
    List<dynamic>? notifications,
  }) => NotificationsState(
    status: status ?? this.status,
    notifications: notifications ?? this.notifications,
  );

  @override
  List<Object> get props => [status, notifications];
}
