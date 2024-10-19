class MyValueState {
  final String value;

  MyValueState({required this.value});

  MyValueState copyWith({String? value}) {
    return MyValueState(value: value ?? this.value);
  }
}
