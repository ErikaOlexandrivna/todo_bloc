import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {
  const TodoInitial();
}


class TodoLoaded extends TodoState {
  final List<String> tasks;

  const TodoLoaded(this.tasks);

  @override
  List<Object?> get props => [tasks];
}
class TodoError extends TodoState {
  final String message;

  const TodoError(this.message);

  @override
  List<Object?> get props => [message];
}