import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/services/guid_gen.dart';
import '../blocs/task_bloc/bloc/task_bloc.dart';
import '../blocs/task_bloc/bloc/task_event.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    Key? key,
  }) : super(key: key);
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Add task",
            style: TextStyle(fontSize: 24.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: titleController,
            autofocus: true,
            decoration: const InputDecoration(
              label: Text("Title"),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      var task = Task(
                          title: titleController.text,
                           id: GuidGen.generate());
                      context.read<TaskBloc>().add(AddTask(task: task));
                      Navigator.pop(context);
                    },
                    child: const Text("Add")),
              ),
            ],
          )
        ],
      ),
    );
  }
}
