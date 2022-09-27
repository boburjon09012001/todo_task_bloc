import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_bloc/models/task.dart';
import 'package:todo_bloc/screens/app_drawer.dart';
import '../blocs/task_bloc/bloc/task_bloc.dart';
import '../widgets/task_lists.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});
  static const id = "task_screen";
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> listTask = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Todo task"),
            actions: [
              IconButton(
                  onPressed: () {
                    _addTask(context);
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          drawer: AppDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(" Tasks: ${state.allTasks.length}"),
                ),
              ),
              TaskLists(listTask: listTask),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addTask(context);
            },
            tooltip: "Add task",
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
