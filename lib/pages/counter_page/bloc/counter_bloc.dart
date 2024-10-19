import 'package:block_state_management/pages/counter_page/bloc/counter_event.dart';
import 'package:block_state_management/pages/counter_page/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<Increment>((event, emit) {
      emit(CounterState(
        count: state.count + 1,
      ));
    });

    on<Decrement>(
      (event, emit) {
        emit(CounterState(count: state.count - 1));
      },
    );

    on<ResetCount>(
      (event, emit) => emit(CounterState(count: 0)),
    );
  }
}
