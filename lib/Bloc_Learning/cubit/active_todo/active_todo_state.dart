// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'active_todo_cubit.dart';

class ActiveTodoState extends Equatable {
  const ActiveTodoState({required this.activeTodoCount});
  final int activeTodoCount;

  factory ActiveTodoState.initail() {
    return const ActiveTodoState(activeTodoCount: 0);
  }

  @override
  List<Object> get props => [activeTodoCount];

  @override
  bool get stringify => true;

  ActiveTodoState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}
