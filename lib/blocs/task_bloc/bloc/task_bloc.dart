import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:todo_bloc/blocs/task_bloc/bloc/task_event.dart';

import '../../../models/task.dart';

part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemovedTask>(_onRemovedTask);
  }
  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      allTasks: List.from(state.allTasks)..add(event.task),
      removedTask: state.removedTask,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);

    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TaskState(allTasks: allTasks, removedTask: state.removedTask));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      allTasks: state.allTasks,
      removedTask: List.from(state.removedTask)..remove(event.task),
    ));
  }

  void _onRemovedTask(RemovedTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      allTasks: List.from(state.allTasks)..remove(event.task),
      removedTask: List.from(state.removedTask)
        ..add(event.task.copyWith(isDeleted: true)),
    ));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
