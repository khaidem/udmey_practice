// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'flitered_todo_bloc.dart';

abstract class FliteredTodoEvent extends Equatable {
  const FliteredTodoEvent();

  @override
  List<Object> get props => [];
}

class CalculatedFilterTodosEvent extends FliteredTodoEvent {
  final List<Todo> filteredTodos;
  const CalculatedFilterTodosEvent({
    required this.filteredTodos,
  });

  @override
  String toString() =>
      'CalculatedFilterTodosEvent(filteredTodos: $filteredTodos)';

  @override
  List<Object> get props => [filteredTodos];
}
