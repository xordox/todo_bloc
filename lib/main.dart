import 'package:flutter/material.dart';
import 'package:todo_bloc/blocs/task_bloc_observer.dart';
import 'package:todo_bloc/models/task.dart';
import 'package:todo_bloc/screens/tasks_screen.dart';

import 'blocs/bloc_barrier.dart';

void main() {
  Bloc.observer = TaskBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc()
      ..add(AddTask(task: Task(title: "Task1"))),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  TasksScreen(),
      ),
    );
  }
}
