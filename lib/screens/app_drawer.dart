import 'package:flutter/material.dart';
import 'package:todo_bloc/blocs/bloc_barrier.dart';
import 'package:todo_bloc/screens/tabs_screen.dart';
import 'package:todo_bloc/screens/recycle_bin.dart';
import 'package:todo_bloc/screens/tasks_screen.dart';

class AppDrawer extends StatelessWidget{
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
              child: Text(
                "Task Drawer",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(TabsScreen.id),
                  child: ListTile(
                    leading: const Icon(
                      Icons.folder_special,
                    ),
                    title: const Text("My Tasks"),
                    trailing: Text("${state.allTasks.length}"),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  child: ListTile(
                    leading: const Icon(
                      Icons.delete,
                    ),
                    title: const Text("Bin"),
                    trailing: Text("${state.removedTasks.length}"),
                  ),
                );
              },
            ),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Switch(
                    value: state.darkMode,
                    onChanged: (newValue) {
                      newValue? context.read<ThemeBloc>().add(DarkThemeEvent())
                      :context.read<ThemeBloc>().add(LightThemeEvent());
                    },);
              },
            )
          ],
        ),
      ),
    );
  }
}
