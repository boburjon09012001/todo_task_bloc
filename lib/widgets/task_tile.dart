import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_bloc/blocs/bloc_export.dart';
import 'package:todo_bloc/widgets/popup_menu_widget.dart';
import '../blocs/bloc/bloc/task_event.dart';
import '../models/task.dart';
import '../screens/edit_task_screen.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;
  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TaskBloc>().add(DeleteTask(task: task))
        : ctx.read<TaskBloc>().add(RemovedTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: EditTaskScreen(oldTask: task),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Row(
            children: [
              task.isFavorite == false
                  ? const Icon(Icons.star_outline)
                  : const Icon(Icons.star),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        decoration:
                            task.isDone! ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    Text(
                      DateFormat()
                          .add_yMEd()
                          .add_Hms()
                          .format(DateTime.parse(task.date)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: task.isDone,
              onChanged: task.isDeleted == false
                  ? (value) {
                      context.read<TaskBloc>().add(UpdateTask(task: task));
                    }
                  : null,
            ),
            PopupMenuWidgets(
              task: task,
              cancelOrDeleteCallback: () => _removeOrDeleteTask(context, task),
              likeOrDislikeCallback: () => context
                  .read<TaskBloc>()
                  .add(MarkFavoriteOrUnFavoriteTask(task: task)),
              editTaskCallback: () {
                Navigator.of(context).pop();
                _editTask(context);
              },
              restoreTaskCallback: () {
                context.read<TaskBloc>().add(RestoreTask(task: task));
              },
            ),
          ],
        ),
      ]),
    );
  }
}


// ListTile(
//       title: Text(
//         task.title,
//         overflow: TextOverflow.ellipsis,
//         style: TextStyle(
//           decoration: task.isDone! ? TextDecoration.lineThrough : null,
//         ),
//       ),
//       trailing: Checkbox(
//         value: task.isDone,
//         onChanged: task.isDeleted == false
//             ? (value) {
//                 context.read<TaskBloc>().add(UpdateTask(task: task));
//               }
//             : null,
//       ),
//       onLongPress: () => _removeOrDeleteTask(context, task),
//      );