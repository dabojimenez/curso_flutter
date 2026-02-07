import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://m.media-amazon.com/images/M/MV5BMzkyMTk2NzM2Ml5BMl5BanBnXkFtZTcwNDQ4MjYzMg@@._V1_FMjpg_UX1000_.jpg',
              ),
            ),
          ),
          title: Text('Mi amor'),
          centerTitle: false,
        ),
        // Container: similar a un div, pero con más funcionalidades
        body: _ChatView(),
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Hacemos la referencia al provider
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        // symmetric: lo hace simetrico en los dos lados
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Expanded: permite expandir al widget hijo, que el padre le de
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble()
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            // Caja de texto
            MessageFieldBox(
              onValue: (value) {
                if (value.trim().isEmpty) return;
                chatProvider.sendMessage(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
