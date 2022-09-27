import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      if (event.value) {
        emit(const SwitchState(switchValue: false));
      } else {
        emit(const SwitchState(switchValue: true));
      }
    });
  }
}
