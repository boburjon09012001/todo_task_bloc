import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/task_bloc/bloc/task_bloc.dart';
import '../widgets/task_lists.dart';
import 'app_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = "recycle_bin_screen";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Recycle Bin"),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
          ),
          drawer:  AppDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text("Tasks ${state.removedTask.length}"),
                ),
              ),
              TaskLists(listTask: state.removedTask),
            ],
          ),
        );
      },
    );
  }
}
