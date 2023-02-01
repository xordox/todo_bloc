import 'package:flutter/material.dart';
import 'package:todo_bloc/screens/recycle_bin.dart';
import 'package:todo_bloc/screens/tasks_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text("Task Drawer",
              style: Theme.of(context).textTheme.headline5,),
            ),
            GestureDetector(
              onTap: ()=>Navigator.of(context).pushNamed(TasksScreen.id),
              child: const ListTile(
                leading: Icon(Icons.folder_special,),
                title: Text("My Tasks"),
                trailing: Text("0"),
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: ()=> Navigator.of(context).pushNamed(RecycleBin.id),
              child: const ListTile(
                leading: Icon(Icons.delete,),
                title: Text("Bin"),
                trailing: Text("0"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}