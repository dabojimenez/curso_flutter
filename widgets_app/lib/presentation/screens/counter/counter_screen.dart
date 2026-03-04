import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';
  
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // watch: que este pendiente del counterProvider (escucha cada vez que cambia)
    final int clickCounter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador - Riverpod'),
      ),
      body: Center(
        child: Text('Valor: $clickCounter'
        , style: Theme.of(context).textTheme.titleLarge
        ,),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}