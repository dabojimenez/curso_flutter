import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/domain/entities/push_message.dart';
import 'package:push_app/presentation/blocs/notifications/notifications_bloc.dart';

class DetailsScreen extends StatelessWidget {
  final String messageId;

  const DetailsScreen({super.key, required this.messageId});

  @override
  Widget build(BuildContext context) {
    final PushMessage? message = context
        .watch<NotificationsBloc>()
        .getMessageById(messageId);
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles push notification')),
      body: message != null
          ? _DetailsView(message: message)
          : const Center(child: Text('Notificacion no existente')),
    );
  }
}

class _DetailsView extends StatelessWidget {
  final PushMessage message;

  const _DetailsView({required this.message});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          if (message.imageUrl != null) Image.network(message.imageUrl!),
          const SizedBox(height: 30),
          Text(message.title, style: textStyles.headlineMedium),
          const SizedBox(height: 10),
          Text(message.body, style: textStyles.bodyMedium),
          const Divider(),
          Text(message.data.toString(), style: textStyles.bodySmall),
        ],
      ),
    );
  }
}
