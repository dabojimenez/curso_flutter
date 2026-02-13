import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullscreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullscreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
  });

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  Widget build(BuildContext context) {
    // widget.caption;
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (context, snapshot) {
        // Aqui se muestra el CircularProgressIndicator, mientras se inicializa el video
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        }

        // Aqui se muestra el video
        // GestureDetector: Detecta los eventos de la pantalla
        return GestureDetector(
          onTap: () {
            // Detectamos el estado del video, y lo invertimos en play o pause
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          },
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(_controller),
                // Gradiente
                VideoBackground(stops: const [0.8, 1.0]),
                // Texto
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({Key? key, required this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtenemos el ancho de la pantalla
    final size = MediaQuery.of(context).size;
    final titleStile = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6, // El 60% del ancho de la pantalla
      child: Text(caption, maxLines: 2, style: titleStile),
    );
  }
}
