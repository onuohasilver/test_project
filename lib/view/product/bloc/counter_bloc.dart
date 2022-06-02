import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  ///
  CounterCubit() : super(1);

  /// Subtract 1 from the current state.
  void decrement() {
    if (state > 0) {
      emit(state - 1);
    }
  }

  /// Add 1 to the current state.
  void increment() => emit(state + 1);

  ///resets the counter to 1
  void reset() => emit(1);
}
