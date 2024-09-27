import 'package:equatable/equatable.dart';

sealed class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddTodo extends TodoEvent {
  final String task;

  AddTodo(this.task);

  @override
  List<Object?> get props => [task];
}