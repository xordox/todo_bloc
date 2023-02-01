import 'package:flutter/material.dart';
import 'package:todo_bloc/blocs/bloc_barrier.dart';
import 'package:todo_bloc/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title,
      style: TextStyle(
        decoration: task.isDone == true? TextDecoration.lineThrough:null,
      ),),
      trailing: Checkbox(
        onChanged: (value) {
          context.read<TaskBloc>().add(UpdateTask(task: task));
        },
        value: task.isDone,
      ),
      onLongPress: () => context.read<TaskBloc>()..add(DeleteTask(task: task)),
    );
  }
}
