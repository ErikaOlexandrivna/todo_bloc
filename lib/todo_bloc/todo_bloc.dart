import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/todo_bloc/todo_event.dart';
import 'package:todo_bloc/todo_bloc/totdo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoInitial()) {
    on<AddTodo>(_onAddTodo);
  }

  final List<String> _tasks = [];

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    _tasks.add(event.task);
    emit(TodoLoaded(List.from(_tasks)));
  }
}
