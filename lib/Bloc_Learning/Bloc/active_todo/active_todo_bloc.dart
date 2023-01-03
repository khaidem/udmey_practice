import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_todo_event.dart';
part 'active_todo_state.dart';

//** For BlocListner */
class ActiveTodoBloc extends Bloc<ActiveTodoEvent, ActiveTodoCountState> {
  final int initialActiveCount;

  ActiveTodoBloc({
    required this.initialActiveCount,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveCount)) {
    on<CalculateActiveTodoCountEvent>((event, emit) {
      emit(state.copyWith(activeTodoCount: event.activeTodoCount));
    });
  }
}

//* For StreamSubcription */
// class ActiveTodoBloc extends Bloc<ActiveTodoEvent, ActiveTodoCountState> {
//   late final StreamSubscription todoListSubscription;
//   final int initialActiveCount;
//   final TodoListBloc todoListBloc;

//   ActiveTodoBloc({required this.initialActiveCount, required this.todoListBloc})
//       : super(ActiveTodoCountState(activeTodoCount: initialActiveCount)) {
//     todoListSubscription =
//         todoListBloc.stream.listen((TodoListStateBloc todoListState) {
//       log('todoListState : $todoListState');
//       final int currentActiveTodoCount = todoListState.todos
//           .where((Todo todo) => !todo.completed)
//           .toList()
//           .length;
//       add(CalculateActiveTodoCountEvent(
//           activeTodoCount: currentActiveTodoCount));
//     });
//     on<CalculateActiveTodoCountEvent>((event, emit) {
//       emit(state.copyWith(activeTodoCount: event.activeTodoCount));
//     });
//   }
//   @override
//   Future<void> close() {
//     todoListSubscription.cancel();
//     return super.close();
//   }
// }
