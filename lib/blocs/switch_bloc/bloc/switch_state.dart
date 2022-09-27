part of 'switch_bloc.dart';

 class SwitchState extends Equatable {
  final bool switchValue;
  const SwitchState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];
}

class SwitchInitial extends SwitchState {
  SwitchInitial({required super.switchValue});
}
