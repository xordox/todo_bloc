part of 'task_bloc.dart';

class TaskState extends Equatable {
  const TaskState({this.allTasks = const <Task>[]});

  final List<Task> allTasks;

  @override
  List<Object> get props => [allTasks];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      allTasks: List<Task>.from(map['allTasks']?.map((x) => Task.fromMap(x))),
    );
  }
}
