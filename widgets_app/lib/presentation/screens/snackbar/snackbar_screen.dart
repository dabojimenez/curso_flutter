import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Título del diálogo'),
        content: const Text('Lore ipsum dolor sit amet asdsdwe edwee lorem * 2'),
        actions: [
          TextButton(
            // onPressed: () => Navigator.of(context).pop(),
            onPressed: () => context.pop(),
            child: const Text('Cerrar'),
          ),
          FilledButton(onPressed: () => context.pop(), child: Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars y Dialogos')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('lorem ipsum dolor sit amet asdsdwe edwee lorem * 2'),
                  ]
                );
              },
              child: Text('Mostrar snackbar'),
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: Text('Mostrar dialogo'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
