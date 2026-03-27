import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nuevo usuario')),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    // SafeArea: recomendado usar para evitar que el contenido se superponga con las áreas especiales de la pantalla (como las barras de estado)
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        // SingleChildScrollView: permite que el contenido sea desplazable si no cabe en la pantalla, util para cuando se usan widgets muy grandes o columnas
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const FlutterLogo(size: 100),

              TextFormField(),
              TextFormField(),
              TextFormField(),
              TextFormField(),
              TextFormField(),

              const SizedBox(height: 20),
              FilledButton.tonalIcon(
                onPressed: () {},
                icon: const Icon(Icons.save),
                label: const Text('Crear usuario'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
