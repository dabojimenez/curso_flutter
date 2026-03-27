import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    // pasamos la referencia
    on<CounterIncreased>(_onCounterIncreased);
  }

  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    // cuando el evento sea usado, hara lo siguiente o se emitira el siguiente proceso
    emit(
      state.copyWith(
        counter: state.counter + event.value,
        transactionCounter: state.transactionCounter + 1,
      ),
    );
  }
}
