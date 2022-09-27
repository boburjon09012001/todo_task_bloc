// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import '../../../models/task.dart';

class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;
  const AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;
  const UpdateTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task task;
  const DeleteTask({required this.task});
  @override
  List<Object> get props => [task];
}

class RemovedTask extends TaskEvent {
  final Task task;
  const RemovedTask({required this.task});
  @override
  List<Object> get props => [task];
}
