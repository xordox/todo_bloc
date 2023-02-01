import 'package:flutter/material.dart';
import 'package:todo_bloc/blocs/bloc_barrier.dart';
import 'package:todo_bloc/screens/app_drawer.dart';
import 'package:todo_bloc/widgets/task_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Recycle Bin"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: const AppDrawer(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                Center(
                  child: Chip(
                      label: Text(
                    "${state.removedTasks.length} Tasks",
                  )),
                ),
                 TaskList(tasksList: state.removedTasks),
              ],
            ),
          ),
        );
      },
    );
  }
}
