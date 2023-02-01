import 'package:flutter/material.dart';
import 'package:todo_bloc/blocs/bloc_barrier.dart';
import 'package:todo_bloc/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TaskBloc>().add(DeleteTask(task: task))
        : ctx.read<TaskBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone == true ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        onChanged: task.isDone == false
            ? (value) {
                context.read<TaskBloc>().add(UpdateTask(task: task));
              }
            : null,
        value: task.isDone,
      ),
      onLongPress: () => _removeOrDeleteTask(context, task),
    );
  }
}
