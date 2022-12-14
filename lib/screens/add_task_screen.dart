import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/bloc/bloc/task_event.dart';

import '../blocs/bloc/bloc/task_bloc.dart';
import '../models/task.dart';
import '../services/guid_gen.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    Key? key,
  }) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10),
            child: TextField(
              controller: titleController,
              autofocus: true,
              decoration: const InputDecoration(
                label: Text("Title"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          TextField(
            controller: descriptionController,
            autofocus: true,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              label: Text("Description"),
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
                          id: GuidGen.generate(),
                          date: DateTime.now().toString(),
                          description: descriptionController.text);
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
