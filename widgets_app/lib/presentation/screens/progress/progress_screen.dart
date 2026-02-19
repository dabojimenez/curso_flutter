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
          _ControllerProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}