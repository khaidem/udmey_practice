// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  const TodoListState({
    required this.todos,
  });
  final List<Todo> todos;

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(id: '1', desc: 'Clean the room'),
      Todo(id: '2', desc: 'Wash the dish'),
      Todo(id: '3', desc: 'Do homeWork')
    ]);
  }

  @override
  List<Object> get props => [todos];

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }

  @override
  bool get stringify => true;
}
