// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'active_todo_bloc.dart';

abstract class ActiveTodoEvent extends Equatable {
  const ActiveTodoEvent();

  @override
  List<Object> get props => [];
}

class CalculateActiveTodoCountEvent extends ActiveTodoEvent {
  final int activeTodoCount;
  const CalculateActiveTodoCountEvent({
    required this.activeTodoCount,
  });

  @override
  String toString() =>
      'CalculateActiveTodoCountEvent(activeTodoCount: $activeTodoCount)';
  @override
  List<Object> get props => [activeTodoCount];
}
