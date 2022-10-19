import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/models/task.dart';

import '../blocs/bloc/bloc/task_bloc.dart';
import '../widgets/task_lists.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});
  static const id = "completed_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> listTask = state.completedTask;
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
