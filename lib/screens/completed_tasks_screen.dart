import 'package:flutter/material.dart';
import 'package:todo_bloc/blocs/bloc_barrier.dart';
import 'package:todo_bloc/models/task.dart';
import 'package:todo_bloc/widgets/task_list.dart';

class CompletedTasksScreen extends StatelessWidget{
  const CompletedTasksScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.completedTasks;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             Center(
              child: Chip(label: Text("${state.pendingTasks.length} Pending | ${state.completedTasks.length} Completed ",)),
            ),
            TaskList(tasksList: taskList),
          ],
        );
      },
    );
  }
}
