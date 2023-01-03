part of 'todo_list_bloc.dart';

class TodoListStateBloc extends Equatable {
  const TodoListStateBloc({
    required this.todos,
  });
  final List<Todo> todos;

  factory TodoListStateBloc.initial() {
    return TodoListStateBloc(todos: [
      Todo(id: '1', desc: 'Clean the room'),
      Todo(id: '2', desc: 'Wash the dish'),
      Todo(id: '3', desc: 'Do homeWork')
    ]);
  }

  @override
  List<Object> get props => [todos];

  TodoListStateBloc copyWith({
    List<Todo>? todos,
  }) {
    return TodoListStateBloc(
      todos: todos ?? this.todos,
    );
  }

  @override
  bool get stringify => true;
}
