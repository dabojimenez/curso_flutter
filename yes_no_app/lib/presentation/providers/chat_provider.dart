import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

// ChangeNotifier: Puedenotificar cunado existen cambios
class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Como estas?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);

    messageList.add(newMessage);
    // // Notificamos que ha existido un cambio, en el providers
    notifyListeners();
  }
}
