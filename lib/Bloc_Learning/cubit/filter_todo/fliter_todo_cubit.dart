import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_app/Bloc_Learning/model/todo.model.dart';

part 'fliter_todo_state.dart';

class FliterTodoCubit extends Cubit<FliterTodoState> {
  final List<Todo> initialTodo;

  FliterTodoCubit({
    required this.initialTodo,
  }) : super(FliterTodoState(filterTodos: initialTodo));

  void setFilterTodo(SearchFilter filter, List<Todo> todos, String searchTerm) {
    List<Todo> _filterTodos;

    switch (filter) {
      case SearchFilter.active:
        _filterTodos = todos.where((Todo todo) => !todo.completed).toList();

        break;

      case SearchFilter.all:
        _filterTodos = todos;
        break;
      case SearchFilter.completed:
        _filterTodos = todos.where((Todo todo) => !todo.completed).toList();
        break;
    }
    if (searchTerm.isNotEmpty) {
      _filterTodos = _filterTodos
          .where((Todo todo) => todo.desc.toLowerCase().contains(searchTerm))
          .toList();
    }
    emit(
      state.copyWith(filterTodos: _filterTodos),
    );
  }
}


//**For Using streamSubscription+Cubit */
// class FliterTodoCubit extends Cubit<FliterTodoState> {
//   late StreamSubscription todoFilterSubscription;
//   late StreamSubscription todoSearchSubscription;
//   late StreamSubscription todoListSubscription;

//   final TodoFilterCubit todoFilterCubit;
//   final TodoSearchFilterCubit todoSearchFilterCubit;
//   final TodoListCubit todoListCubit;
//   final List<Todo> initialTodo;

//   FliterTodoCubit({
//     required this.initialTodo,
//     required this.todoFilterCubit,
//     required this.todoSearchFilterCubit,
//     required this.todoListCubit,
//   }) : super(FliterTodoState(filterTodos: initialTodo)) {
//     todoFilterSubscription =
//         todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
//       setFilterTodo();
//     });
//     todoFilterSubscription = todoSearchFilterCubit.stream
//         .listen((TodoSearchFilterState todoSearchFilterState) {
//       setFilterTodo();
//     });
//     todoFilterSubscription =
//         todoListCubit.stream.listen((TodoListState todoListCubit) {
//       setFilterTodo();
//     });
//   }
//   void setFilterTodo() {
//     List<Todo> _filterTodos;

//     switch (todoFilterCubit.state.filter) {
//       case SearchFilter.active:
//         _filterTodos = todoListCubit.state.todos
//             .where((Todo todo) => !todo.completed)
//             .toList();

//         break;

//       case SearchFilter.all:
//         _filterTodos = todoListCubit.state.todos;
//         break;
//       case SearchFilter.completed:
//         _filterTodos = todoListCubit.state.todos
//             .where((Todo todo) => !todo.completed)
//             .toList();
//         break;
//     }
//     if (todoSearchFilterCubit.state.searchItem.isNotEmpty) {
//       _filterTodos = _filterTodos
//           .where((Todo todo) => todo.desc
//               .toLowerCase()
//               .contains(todoSearchFilterCubit.state.searchItem))
//           .toList();
//     }
//     emit(state.copyWith(filterTodos: _filterTodos));
//   }

//   @override
//   Future<void> close() {
//     todoFilterSubscription.cancel();
//     todoSearchSubscription.cancel();
//     todoListSubscription.cancel();
//     return super.close();
//   }
// }
