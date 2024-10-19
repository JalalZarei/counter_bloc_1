import 'package:block_state_management/pages/counter_page/bloc/counter_bloc.dart';
import 'package:block_state_management/pages/counter_page/bloc/my_value_bloc.dart';
import 'package:block_state_management/pages/counter_page/views/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
          BlocProvider(
            create: (context) => MyValueBloc(),
          )
        ],
        child: const CounterPage(),
      ),
    );
  }
}
