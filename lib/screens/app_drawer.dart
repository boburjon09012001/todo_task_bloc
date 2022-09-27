import 'package:flutter/material.dart';
import 'package:todo_bloc/screens/recycle_bin.dart';
import 'package:todo_bloc/screens/task_screen.dart';
import '../blocs/bloc_export.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({super.key});
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text("Task Drawer",
                  style: Theme.of(context).textTheme.headline5),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(TaskScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text("My Task"),
                    trailing: Text('${state.allTasks.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text("Bin"),
                    trailing: Text('${state.removedTask.length}'),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                    value: switchValue,
                    onChanged: (newValue) {
                      newValue
                          ? context.read<SwitchBloc>().add(SwitchOnEvent())
                          : context.read<SwitchBloc>().add(SwitchOffEvent());
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
