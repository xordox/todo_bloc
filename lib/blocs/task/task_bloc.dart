import 'package:equatable/equatable.dart';
import 'package:todo_bloc/blocs/bloc_barrier.dart';
import 'package:todo_bloc/models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit){
    final state = this.state;
    emit(TaskState(
      allTasks: List.from(state.allTasks)..add(event.task),
      removedTasks: state.removedTasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit){
    final state = this.state;
    final task = event.task;
//index is used to reposition updated task in previous index
final int index = state.allTasks.indexOf(task);
    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
    //.add won't maintain previous index of task
    //allTasks.add(task.copyWith(isDone: false)); 
    ? allTasks.insert(index,task.copyWith(isDone: true))
    : allTasks.insert(index,task.copyWith(isDone: false));


    emit(TaskState(allTasks: allTasks,removedTasks: state.removedTasks),);


  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit){
    final state = this.state;
    emit(TaskState(allTasks: state.allTasks,
    removedTasks: List.from(state.removedTasks)..remove(event.task),
    ));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TaskState> emit){
    final state = this.state;
    emit(TaskState(
      allTasks: List.from(state.allTasks)..remove(event.task),
      removedTasks: List.from(state.removedTasks)
      ..add(event.task.copyWith(isDeleted: true))));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
