import 'package:flutter/material.dart';
import 'package:todo_bloc/widgets/task_tile.dart';
import '../models/task.dart';

class TaskLists extends StatelessWidget {
  const TaskLists({
    Key? key,
    required this.listTask,
  }) : super(key: key);

  final List<Task> listTask;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: listTask.length,
          itemBuilder: (context, index) {
            var task = listTask[index];
            return TaskTile(task: task);
          }),
    );
  }
}
