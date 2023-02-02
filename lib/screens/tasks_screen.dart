import 'package:flutter/material.dart';
import 'package:todo_bloc/blocs/bloc_barrier.dart';
import 'package:todo_bloc/models/task.dart';
import 'package:todo_bloc/screens/add_task_screen.dart';
import 'package:todo_bloc/screens/app_drawer.dart';
import 'package:todo_bloc/widgets/task_list.dart';

class TasksScreen extends StatefulWidget {
   const TasksScreen({Key? key}) : super(key: key);
   static const id = 'tasks_screen';

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             Center(
              child: Chip(label: Text("${state.allTasks.length} Tasks",)),
            ),
            TaskList(tasksList: taskList),
          ],
        );
      },
    );
  }
}
