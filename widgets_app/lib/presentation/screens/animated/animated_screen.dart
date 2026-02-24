import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {

  static const String nameRoute = 'animated_screen';

  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 100;
  double height = 100;
  Color color = Colors.indigo;
  double borderRadius = 20;

  void changeShape(){
    final random = Random();
    // random.nextInt(300): valor maximo de hasta 300, se suma 120 para que el valor minimo sea 120
    width = random.nextInt(300).toDouble() + 120;
    height = random.nextInt(300).toDouble() + 120;
    color = Color.fromRGBO(
      random.nextInt(255), // red
      random.nextInt(255), // green
      random.nextInt(255), // blue
      1) // opacity
      ; 
    borderRadius = random.nextInt(100).toDouble() + 20;
    setState(() {});
  }

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
          curve: Curves.easeInCubic,
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          changeShape();
        },
      ),
    );
  }
}