import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void incraseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increasBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // Escuamos los cambios que tiene el state
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        // context.select: de esta forma, seleccionamos un bloc nada mas y no estar escuchando TODOOO los wifgets
        title: context.select((CounterCubit value) {
          return Text(
            'Cubit counter: ${value.state.transactionCount} transacciones',
          );
        }),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterCubit>().reset();
            },
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // // buildWhen: nos permite construir unicamente CUANDO se cumpla una condición
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () {
              incraseCounterBy(context, 3);
            },
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () {
              incraseCounterBy(context, 2);
            },
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () {
              incraseCounterBy(context);
            },
          ),
        ],
      ),
    );
  }
}
