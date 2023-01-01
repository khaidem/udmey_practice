// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fliter_todo_cubit.dart';

class FliterTodoState extends Equatable {
  final List<Todo> filterTodos;
  const FliterTodoState({
    required this.filterTodos,
  });

  factory FliterTodoState.initial() {
    return const FliterTodoState(filterTodos: []);
  }

  @override
  List<Object> get props => [filterTodos];

  FliterTodoState copyWith({
    List<Todo>? filterTodos,
  }) {
    return FliterTodoState(
      filterTodos: filterTodos ?? this.filterTodos,
    );
  }

  @override
  bool get stringify => true;
}
