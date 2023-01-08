import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_todo_state.dart';

//** For Cubit + BlocListener */
class ActiveTodoCubit extends Cubit<ActiveTodoState> {
  final int initialActiveCount;

  ActiveTodoCubit({
    required this.initialActiveCount,
  }) : super(ActiveTodoState(activeTodoCount: initialActiveCount));

  void calculateActiveTodoCubit(int activeTodoCount) {
    emit(state.copyWith(activeTodoCount: activeTodoCount));
  }
}

//** For cubit+StreamSubCription method */
// class ActiveTodoCubit extends Cubit<ActiveTodoState> {
//   late final StreamSubscription todoListSubscription;
//   final int initialActiveCount;
//   final TodoListCubit todoListCubit;
//   ActiveTodoCubit(
//       {required this.initialActiveCount, required this.todoListCubit})
//       : super(ActiveTodoState(activeTodoCount: initialActiveCount)) {
//     todoListSubscription =
//         todoListCubit.stream.listen((TodoListState todoListState) {
//       log('todoListState : $todoListState');
//       final int currentActiveTodoCount = todoListState.todos
//           .where((Todo todo) => !todo.completed)
//           .toList()
//           .length;
//       emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
//     });
//   }

//   @override
//   Future<void> close() {
//     todoListSubscription.cancel();
//     return super.close();
//   }
// }
