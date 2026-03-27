part of 'counter_bloc.dart';

// nos permite que tipo de evntos nuestro Bloc, va a recibir
sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int value;
  const CounterIncreased(this.value);
}
