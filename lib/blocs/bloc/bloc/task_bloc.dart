import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:todo_bloc/blocs/bloc/bloc/task_event.dart';

import '../../../models/task.dart';

part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemovedTask>(_onRemovedTask);
    on<MarkFavoriteOrUnFavoriteTask>(_onMarkFavoriteOrUnFavoriteTask);
    on<EditTask>(_onEditTask);
    on<RestoreTask>(_onRestoreTask);
    on<DeleteAllTask>(_onDeleteAllTask);
  }
  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      pandingTask: List.from(state.pandingTask)..add(event.task),
      removedTask: state.removedTask,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.pandingTask.indexOf(task);

    List<Task> pandingTask = state.pandingTask;
    List<Task> completedTask = state.completedTask;

    task.isDone == false
        ? {
            pandingTask = List.from(pandingTask)..remove(task),
            completedTask = List.from(completedTask)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            completedTask = List.from(completedTask)..remove(task),
            pandingTask = List.from(pandingTask)
              ..insert(0, task.copyWith(isDone: false)),
          };

    emit(TaskState(
      pandingTask: pandingTask,
      completedTask: completedTask,
      favoriteTask: state.favoriteTask,
      removedTask: state.removedTask,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      pandingTask: state.pandingTask,
      completedTask: state.completedTask,
      favoriteTask: state.favoriteTask,
      removedTask: List.from(state.removedTask)..remove(event.task),
    ));
  }

  void _onRemovedTask(RemovedTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      pandingTask: List.from(state.pandingTask)..remove(event.task),
      completedTask: List.from(state.completedTask)..remove(event.task),
      favoriteTask: List.from(state.favoriteTask)..remove(event.task),
      removedTask: List.from(state.removedTask)
        ..add(event.task.copyWith(isDeleted: true)),
    ));
  }

  void _onMarkFavoriteOrUnFavoriteTask(
      MarkFavoriteOrUnFavoriteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    List<Task> pendingTasks = state.pandingTask;
    List<Task> completedTask = state.completedTask;
    List<Task> favoriteTask = state.favoriteTask;
    if (event.task.isDone == false) {
      if (event.task.isFavorite == false) {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTask.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTask.remove(event.task);
      }
    } else {
      if (event.task.isFavorite == false) {
        var taskIndex = completedTask.indexOf(event.task);
        completedTask = List.from(completedTask)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTask.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = completedTask.indexOf(event.task);
        completedTask = List.from(completedTask)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTask.remove(event.task);
      }
      emit(TaskState(
        pandingTask: pendingTasks,
        completedTask: completedTask,
        favoriteTask: favoriteTask,
        removedTask: state.removedTask,
      ));
    }
  }

  void _onEditTask(EditTask event, Emitter<TaskState> emit) {
    final state = this.state;
    List<Task> favoriteTask = state.favoriteTask;
    if (event.oldTask.isFavorite == true) {
      favoriteTask
        ..remove(event.oldTask)
        ..insert(0, event.newTask);
    }
    emit(
      TaskState(
        pandingTask: List.from(state.pandingTask)
          ..remove(event.oldTask)
          ..insert(0, event.newTask),
        completedTask: state.completedTask..remove(event.oldTask),
        favoriteTask: favoriteTask,
        removedTask: state.removedTask,
      ),
    );
  }

  void _onRestoreTask(RestoreTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      removedTask: List.from(state.removedTask)..remove(event.task),
      pandingTask: List.from(state.pandingTask)
        ..insert(
            0,
            event.task.copyWith(
              isDeleted: false,
              isDone: false,
              isFavorite: false,
            )),
      completedTask: state.completedTask,
      favoriteTask: state.favoriteTask,
    ));
  }

  void _onDeleteAllTask(DeleteAllTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      removedTask: List.from(state.removedTask)..clear(),
      pandingTask: state.pandingTask,
      completedTask: state.completedTask,
      favoriteTask: state.favoriteTask,
    ));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    throw UnimplementedError();
  }
}
