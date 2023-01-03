part of 'flitered_todo_bloc.dart';

class FilteredTodoState extends Equatable {
  final List<Todo> filterTodos;
  const FilteredTodoState({
    required this.filterTodos,
  });

  factory FilteredTodoState.initial() {
    return const FilteredTodoState(filterTodos: []);
  }

  @override
  List<Object> get props => [filterTodos];

  FilteredTodoState copyWith({
    List<Todo>? filterTodos,
  }) {
    return FilteredTodoState(
      filterTodos: filterTodos ?? this.filterTodos,
    );
  }

  @override
  bool get stringify => true;
}
