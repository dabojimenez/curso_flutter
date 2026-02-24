import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {

  static const String nameRoute = 'animated_screen';

  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          // duration: la duración de la animación que se aplicará
          duration: const Duration(milliseconds: 400),
          // curve: : tipo de animación 
          curve: Curves.easeOutCubic,
          width: 100,
          height: 160,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {},
      ),
    );
  }
}