// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_filter_cubit.dart';

class TodoFilterState {
  final SearchFilter filter;

  TodoFilterState({required this.filter});
//For the initail State of ui
  factory TodoFilterState.initial() {
    return TodoFilterState(filter: SearchFilter.all);
  }

  @override
  bool operator ==(covariant TodoFilterState other) {
    if (identical(this, other)) return true;

    return other.filter == filter;
  }

  @override
  int get hashCode => filter.hashCode;

  TodoFilterState copyWith({
    SearchFilter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }
}
