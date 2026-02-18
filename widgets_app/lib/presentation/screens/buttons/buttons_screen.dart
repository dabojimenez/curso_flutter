import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Botones Screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity, // para que ocupe todo el ancho
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            // enviamos null, para desabilitar el boton
            ElevatedButton(
              onPressed: null,
              child: const Text('Elevate disable'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text('Elevated Button Icon'),
              icon: const Icon(Icons.access_alarm),
            ),
            FilledButton(onPressed: () {}, child: const Text('Filed button')),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.access_alarm),
              label: const Text('Filed button icon'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined button'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.access_alarm),
              label: const Text('Outlined button icon'),
            ),
            TextButton(onPressed: () {}, child: const Text('Text button')),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.access_alarm),
              label: const Text('Text button icon'),
            ),

            // TODO: Custom button
            IconButton(onPressed: () {}, icon: const Icon(Icons.access_alarm)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.terminal),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(color.primary),
                iconColor: MaterialStatePropertyAll(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
