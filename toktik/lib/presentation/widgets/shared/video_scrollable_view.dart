import 'package:flutter/material.dart';
import 'package:toktik/domain/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    // PageView: similar a un listado, nos pemrite un scrol,a pantalla completa
    return PageView(
      scrollDirection: Axis.vertical, // Habilitamos el scroll vertical
      // Habilitamos para android, para que el scroll sea rebotante
      physics: const BouncingScrollPhysics(),
      children: [
        Container(color: Colors.red,),
        Container(color: Colors.green,),
        Container(color: Colors.blue,),
      ],
    );
  }
}
