part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  CounterState({this.counter = 0, this.transactionCount = 0});

  // Metodo que crea una copia del estado actual con los valores modificados
  CounterState copyWith({int? counter, int? transactionCount}) {
    return CounterState(
      counter: counter ?? this.counter,
      transactionCount: transactionCount ?? this.transactionCount,
    );
  }

  @override
  // si el counter y transactioncounter son iguales, ya no se dibujaria,m y es una validacion importante no solo por lo cubits
  List<Object> get props => [counter, transactionCount];
}
