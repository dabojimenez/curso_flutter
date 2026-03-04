import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';
  
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // watch: que este pendiente del counterProvider (escucha cada vez que cambia)
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador - Riverpod'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
            },
          )
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter'
        , style: Theme.of(context).textTheme.titleLarge
        ,),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // PESIMA PRACTICA USAR EL WATCH, EN METODOS
          // ref.watch(counterProvider);
          // Siempre usar un read, para modificar el estado
          // state: es el valor que se retorna
          ref.read(counterProvider.notifier).state++;
          // similar al read, de arriba
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }
}