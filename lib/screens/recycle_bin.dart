import 'package:flutter/material.dart';
import 'package:todo_bloc/screens/app_drawer.dart';
import 'package:todo_bloc/widgets/task_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text("Recycle Bin"),
            actions: [IconButton(onPressed: () {},
            icon: const Icon(Icons.add),)],
          ),
          drawer: const AppDrawer(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                 Center(
                  child: Chip(label: Text("Tasks",)),
                ),
                TaskList(tasksList: []),
              ],
            ),
          ),
          
        );
  }
}