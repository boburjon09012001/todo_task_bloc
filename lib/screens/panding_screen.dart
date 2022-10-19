import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/models/task.dart';
import '../blocs/bloc/bloc/task_bloc.dart';
import '../widgets/task_lists.dart';

class PandingScreen extends StatelessWidget {
  const PandingScreen({super.key});
  static const id = "panding_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> listTask = state.pandingTask;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  "  ${listTask.length} Panding | ${state.completedTask.length} Completed",
                ),
              ),
            ),
            TaskLists(listTask: listTask),
          ],
        );
      },
    );
  }
}
