part of 'active_todo_bloc.dart';

class ActiveTodoCountState extends Equatable {
  const ActiveTodoCountState({required this.activeTodoCount});
  final int activeTodoCount;

  factory ActiveTodoCountState.initail() {
    return const ActiveTodoCountState(activeTodoCount: 0);
  }

  @override
  List<Object> get props => [activeTodoCount];

  @override
  bool get stringify => true;

  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}
