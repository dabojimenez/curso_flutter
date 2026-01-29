import 'package:flutter/material.dart';

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
              backgroundImage: NetworkImage('https://m.media-amazon.com/images/M/MV5BMzkyMTk2NzM2Ml5BMl5BanBnXkFtZTcwNDQ4MjYzMg@@._V1_FMjpg_UX1000_.jpg'),
            ),
          ),
          title: Text('Mi amor'),
          centerTitle: false,
        ),
      ),
    );
  }
}