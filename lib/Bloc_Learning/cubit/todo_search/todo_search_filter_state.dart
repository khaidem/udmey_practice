// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_search_filter_cubit.dart';

class TodoSearchFilterState extends Equatable {
  const TodoSearchFilterState({
    required this.searchItem,
  });
  final String searchItem;

  factory TodoSearchFilterState.initial() {
    return const TodoSearchFilterState(searchItem: '');
  }

  @override
  List<Object> get props => [searchItem];

  @override
  bool get stringify => true;

  TodoSearchFilterState copyWith({
    String? searchItem,
  }) {
    return TodoSearchFilterState(
      searchItem: searchItem ?? this.searchItem,
    );
  }
}
