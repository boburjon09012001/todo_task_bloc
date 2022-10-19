import 'package:flutter/material.dart';
import 'package:todo_bloc/blocs/bloc/bloc/task_event.dart';
import '../blocs/bloc_export.dart';
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
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {
                      context.read<TaskBloc>().add(DeleteAllTask());
                    },
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_forever),
                        label: const Text("Delete all tasks")),
                  ),
                ],
              ),
            ],
          ),
          drawer: const AppDrawer(),
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
