import 'package:flutter/material.dart';
import 'package:todo_bloc/screens/add_task_screen.dart';
import 'package:todo_bloc/screens/app_drawer.dart';
import 'package:todo_bloc/screens/tasks_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({ Key? key }) : super(key: key);
  static const id = 'tabs_screen';

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddTaskScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tabs Screen"),
        actions: [IconButton(onPressed: () => _addTask(context), icon: Icon(Icons.add))],
          
      ),
      drawer: AppDrawer(),
      body: const TasksScreen(),
      floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            onTap: (index){},
            items: const[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
            label: "Pending Tasks",),
            BottomNavigationBarItem(
              icon: Icon(Icons.done),
            label: "Completed Tasks",),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
            label: "Favorite Tasks",),
          ]),
    );
  }
}