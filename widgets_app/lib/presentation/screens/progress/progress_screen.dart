import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String nameRoute = 'progress';

  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(height: 20),
          Text('Circular progress indecator'),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black45,
          ),

          SizedBox(height: 20),
          Text('Circular progress indecator controlado'),
          SizedBox(height: 20),
          _ControllerProgressIndicator()
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // StreamBuilder: se construye en tiempo de ejecucion y esta asociado a un strem, que e sun flujo de informacion
    // StreamBuilder: es un widget que nos permite escuchar un stream y reaccionar a los cambios en el
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(seconds: 1),
        (value) {
          return ( value * 2 ) / 10; // 0.0, 0.2, 0.4, 0.6, 0.8, 1.0
        },
      ).takeWhile((value) => value <= 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0.0;
        return snapshot.hasData
        ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black45,
              ),
              const SizedBox(width: 20),
              // : toma todo el espacio que el padre le da
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.black45,
                ),
              ),
            ],
          ),
        )
        : const SizedBox.shrink();
      }
    );
  }
}