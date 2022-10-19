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
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
            children: listTask
                .map(
                  (task) => ExpansionPanelRadio(
                      value: task.id,
                      headerBuilder: (context, isOpen) => TaskTile(task: task),
                      body: Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 12),
                        child: ListTile(
                          title: SelectableText.rich(TextSpan(
                            children: [
                              const TextSpan(
                                text: "Text\n",
                                style: TextStyle(fontSize: 19),
                              ),
                              TextSpan(text: task.title),
                              const TextSpan(
                                text: "\n\nDescription\n",
                                style: TextStyle(fontSize: 19),
                              ),
                              TextSpan(text: task.description),
                            ],
                          )),
                        ),
                      )),
                )
                .toList()),
      ),
    );
  }
}



// Expanded(
//       child: ListView.builder(
//           itemCount: listTask.length,
//           itemBuilder: (context, index) {
//             var task = listTask[index];
//             return TaskTile(task: task);
//           }),
//     );