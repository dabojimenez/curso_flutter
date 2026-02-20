import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const String nameRoute = 'snackbar';

  const SnackbarScreen({Key? key}) : super(key: key);

  void showCustomSnackbar(BuildContext context) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Mostrando snackbar'),
      action: SnackBarAction(
        label: 'Acción',
        onPressed: () {
          // Código para manejar la acción del botón
        },
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context,).showSnackBar(snackBar); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars y Dialogos')),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
