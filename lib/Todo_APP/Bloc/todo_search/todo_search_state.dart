part of 'todo_search_bloc.dart';

class TodoSearchState extends Equatable {
  const TodoSearchState({
    required this.searchItem,
  });
  final String searchItem;

  factory TodoSearchState.initial() {
    return const TodoSearchState(searchItem: '');
  }

  @override
  List<Object> get props => [searchItem];

  @override
  bool get stringify => true;

  TodoSearchState copyWith({
    String? searchItem,
  }) {
    return TodoSearchState(
      searchItem: searchItem ?? this.searchItem,
    );
  }
}
