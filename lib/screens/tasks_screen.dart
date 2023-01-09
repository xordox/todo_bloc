
import 'package:flutter/material.dart';
import 'package:todo_bloc/models/task.dart';

class TasksScreen extends StatefulWidget {
   TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasksList = [
    Task(title: 'Task1'),
    Task(title: 'Task2'),
    Task(title: 'Task3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task App"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tasks:',
            ),
            ListView.builder(shrinkWrap:true,itemCount: tasksList.length,itemBuilder:  (context, index) {
              Task task = tasksList[index];
              return ListTile(
                title: Text(task.title),
                trailing: Checkbox(onChanged: (value){},value: task.isDone,),

              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
