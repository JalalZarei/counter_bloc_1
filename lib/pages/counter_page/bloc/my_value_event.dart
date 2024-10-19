abstract class MyValueEvent {}

class UpdateMyValue extends MyValueEvent {
  final String newValue;

  UpdateMyValue(this.newValue);
}
