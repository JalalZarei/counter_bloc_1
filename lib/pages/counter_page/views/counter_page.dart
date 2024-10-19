import 'package:block_state_management/pages/counter_page/bloc/counter_bloc.dart';
import 'package:block_state_management/pages/counter_page/bloc/counter_event.dart';
import 'package:block_state_management/pages/counter_page/bloc/counter_state.dart';
import 'package:block_state_management/pages/counter_page/bloc/my_value_bloc.dart';
import 'package:block_state_management/pages/counter_page/bloc/my_value_event.dart';
import 'package:block_state_management/pages/counter_page/bloc/my_value_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingActionButton(context),
      appBar: _appBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget? _appBar() => AppBar(
        title: const Text('Counter Sample'),
      );

  Widget _body() => Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _count(),
            const SizedBox(
              width: 20,
            ),
            _myValue(),
          ],
        ),
      );

  Widget _myValue() => BlocBuilder<MyValueBloc, MyValueState>(
        builder: (BuildContext context, MyValueState state) => Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Center(
            child: Text(state.value),
          ),
        ),
      );

  Widget _count() => BlocBuilder<CounterBloc, CounterState>(
        builder: (BuildContext context, state) => Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          child: Center(
            child: Text(state.count.toString()),
          ),
        ),
      );

  Widget _floatingActionButton(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    final myValueBloc = context.read<MyValueBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _incrementButton(
          onPressed: () => counterBloc.add(Increment()),
        ),
        _decrementButton(
          onPressed: () => counterBloc.add(Decrement()),
        ),
        _resetButton(
          onPressed: () => counterBloc.add(ResetCount()),
        ),
        _setNewValueButton(
          onPressed: () => myValueBloc.add(UpdateMyValue('thats New Value')),
        ),
      ],
    );
  }

  Widget _incrementButton({required void Function()? onPressed}) =>
      ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.green),
        ),
        child: const Icon(Icons.add),
      );

  Widget _decrementButton({required void Function()? onPressed}) =>
      ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.red)),
        onPressed: onPressed,
        child: const Icon(Icons.remove),
      );

  Widget _resetButton({required void Function()? onPressed}) => ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.amberAccent)),
        child: const Text('Reset'),
      );
  Widget _setNewValueButton({required void Function()? onPressed}) =>
      ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.amberAccent)),
        child: const Text('setValue'),
      );
}
