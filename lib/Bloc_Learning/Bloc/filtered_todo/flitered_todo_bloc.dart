import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/todo.model.dart';

part 'flitered_todo_event.dart';
part 'flitered_todo_state.dart';

//** For BlocListner */
class FliteredTodoBloc extends Bloc<FliteredTodoEvent, FilteredTodoState> {
  final List<Todo> initialTodo;

  FliteredTodoBloc({
    required this.initialTodo,
  }) : super(FilteredTodoState(filterTodos: initialTodo)) {
    on<CalculatedFilterTodosEvent>((event, emit) {
      emit(state.copyWith(filterTodos: event.filteredTodos));
    });
  }

  // void setFilterTodo() {
  //   List<Todo> _filterTodos;

  //   switch (todoFilterBloc.state.filter) {
  //     case SearchFilter.active:
  //       _filterTodos = todoListBloc.state.todos
  //           .where((Todo todo) => !todo.completed)
  //           .toList();

  //       break;

  //     case SearchFilter.all:
  //       _filterTodos = todoListBloc.state.todos;
  //       break;
  //     case SearchFilter.completed:
  //       _filterTodos = todoListBloc.state.todos
  //           .where((Todo todo) => !todo.completed)
  //           .toList();
  //       break;
  //   }
  //   if (todoSearchFilterBloc.state.searchItem.isNotEmpty) {
  //     _filterTodos = _filterTodos
  //         .where((Todo todo) => todo.desc
  //             .toLowerCase()
  //             .contains(todoSearchFilterBloc.state.searchItem))
  //         .toList();
  //   }
  //   add(CalculatedFilterTodosEvent(filteredTodos: _filterTodos));
  // }

}


//** For StreamSubcription */
// class FliteredTodoBloc extends Bloc<FliteredTodoEvent, FilteredTodoState> {
//   late StreamSubscription todoFilterSubscription;
//   late StreamSubscription todoSearchSubscription;
//   late StreamSubscription todoListSubscription;

//   final TodoFilterBloc todoFilterBloc;
//   final TodoSearchBloc todoSearchFilterBloc;
//   final TodoListBloc todoListBloc;
//   final List<Todo> initialTodo;

//   FliteredTodoBloc({
//     required this.initialTodo,
//     required this.todoFilterBloc,
//     required this.todoSearchFilterBloc,
//     required this.todoListBloc,
//   }) : super(FilteredTodoState(filterTodos: initialTodo)) {
//     todoFilterSubscription =
//         todoFilterBloc.stream.listen((TodoFilterState todoFilterState) {
//       setFilterTodo();
//     });
//     todoFilterSubscription = todoSearchFilterBloc.stream
//         .listen((TodoSearchState todoSearchFilterState) {
//       setFilterTodo();
//     });
//     todoFilterSubscription =
//         todoListBloc.stream.listen((TodoListStateBloc todoListCubit) {
//       setFilterTodo();
//     });

//     on<CalculatedFilterTodosEvent>((event, emit) {
//       emit(state.copyWith(filterTodos: event.filteredTodos));
//     });
//   }

//   void setFilterTodo() {
//     List<Todo> _filterTodos;

//     switch (todoFilterBloc.state.filter) {
//       case SearchFilter.active:
//         _filterTodos = todoListBloc.state.todos
//             .where((Todo todo) => !todo.completed)
//             .toList();

//         break;

//       case SearchFilter.all:
//         _filterTodos = todoListBloc.state.todos;
//         break;
//       case SearchFilter.completed:
//         _filterTodos = todoListBloc.state.todos
//             .where((Todo todo) => !todo.completed)
//             .toList();
//         break;
//     }
//     if (todoSearchFilterBloc.state.searchItem.isNotEmpty) {
//       _filterTodos = _filterTodos
//           .where((Todo todo) => todo.desc
//               .toLowerCase()
//               .contains(todoSearchFilterBloc.state.searchItem))
//           .toList();
//     }
//     add(CalculatedFilterTodosEvent(filteredTodos: _filterTodos));
//   }

//   @override
//   Future<void> close() {
//     todoFilterSubscription.cancel();
//     todoSearchSubscription.cancel();
//     todoListSubscription.cancel();
//     return super.close();
//   }
// }
