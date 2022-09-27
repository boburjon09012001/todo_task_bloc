part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnEvent extends SwitchEvent {
  final bool value;

  const SwitchOnEvent(this.value);
  @override
  List<Object> get props => [value];
}


