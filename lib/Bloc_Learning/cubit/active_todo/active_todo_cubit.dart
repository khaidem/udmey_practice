import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_app/Bloc_Learning/cubit/todo_list/todo_list_cubit.dart';
import 'package:practice_app/Bloc_Learning/model/todo.model.dart';

part 'active_todo_state.dart';

class ActiveTodoCubit extends Cubit<ActiveTodoState> {
  late final StreamSubscription todoListSubscription;
  final int initialActiveCount;
  final TodoListCubit todoListCubit;
  ActiveTodoCubit(
      {required this.initialActiveCount, required this.todoListCubit})
      : super(ActiveTodoState(activeTodoCount: initialActiveCount)) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      log('todoListState : $todoListState');
      final int currentActiveTodoCount = todoListState.todos
          .where((Todo todo) => !todo.completed)
          .toList()
          .length;
      emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
