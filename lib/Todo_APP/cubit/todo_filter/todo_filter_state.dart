// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'todo_filter_cubit.dart';

class TodoFilterState extends Equatable {
  final SearchFilter filter;
  TodoFilterState({
    required this.filter,
  });

  factory TodoFilterState.initial() {
    return TodoFilterState(filter: SearchFilter.all);
  }

  @override
  List<Object> get props => [filter];

  @override
  bool get stringify => true;

  TodoFilterState copyWith({
    SearchFilter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }
}
