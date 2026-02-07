import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

// ChangeNotifier: Puedenotificar cunado existen cambios
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Como estas?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);

    messageList.add(newMessage);
    // // Notificamos que ha existido un cambio, en el providers
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    // Agregamos un pequeño detalle para el deley, para dar una mejro experiencia
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      // A lo maximo que el scroll puede dar
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
