// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> pandingTask;
  final List<Task> completedTask;
  final List<Task> favoriteTask;
  final List<Task> removedTask;
  const TaskState({
    this.pandingTask = const <Task>[],
    this.completedTask = const <Task>[],
    this.favoriteTask = const <Task>[],
    this.removedTask = const <Task>[],
  });

  @override
  List<Object> get props => [pandingTask];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pandingTask': pandingTask.map((x) => x.toMap()).toList(),
      'completedTask': completedTask.map((x) => x.toMap()).toList(),
      'favoriteTask': favoriteTask.map((x) => x.toMap()).toList(),
      'removedTask': pandingTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      pandingTask: List<Task>.from(
        (map['pandingTask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
        ),
         completedTask: List<Task>.from(
        (map['completedTask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
        ),
         favoriteTask: List<Task>.from(
        (map['favoriteTask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
        ),


      removedTask: List<Task>.from(
        (map['removedTask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
