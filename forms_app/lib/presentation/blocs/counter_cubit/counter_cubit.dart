import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 5));

  void increasBy(int value) {
    // NOTA: No podemos mutar el estado, ya que es final
    // Por lo tanto, debemos crear un nuevo estado y por eso usamos el método emit y esta el copyWith
    emit(
      state.copyWith(
        counter: state.counter + value,
        transactionCount: state.transactionCount + 1,
      ),
    );
  }

  void reset() {
    emit(state.copyWith(counter: 0));
  }
}
