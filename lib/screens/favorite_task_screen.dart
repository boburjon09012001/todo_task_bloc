import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/models/task.dart';
import '../blocs/bloc/bloc/task_bloc.dart';
import '../widgets/task_lists.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  static const id = "favorite_screen";
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> listTask = state.favoriteTask;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(" Tasks: ${listTask.length}"),
              ),
            ),
            TaskLists(listTask: listTask),
          ],
        );
      },
    );
  }
}
