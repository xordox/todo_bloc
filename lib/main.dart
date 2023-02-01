import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_bloc/blocs/task_bloc_observer.dart';
import 'package:todo_bloc/screens/tasks_screen.dart';
import 'package:todo_bloc/services/app_router.dart';

import 'blocs/bloc_barrier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  Bloc.observer = TaskBlocObserver();
  HydratedBlocOverrides.runZoned(
    () => runApp( MyApp(appRouter: AppRouter(),)),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TasksScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
