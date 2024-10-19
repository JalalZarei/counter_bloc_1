import 'package:block_state_management/pages/counter_page/bloc/my_value_event.dart';
import 'package:block_state_management/pages/counter_page/bloc/my_value_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyValueBloc extends Bloc<MyValueEvent, MyValueState> {
  MyValueBloc() : super(MyValueState(value: 'initialValue')) {
    on<UpdateMyValue>(
      (event, emit) => emit(state.copyWith(value: event.newValue)),
    );
  }
}
