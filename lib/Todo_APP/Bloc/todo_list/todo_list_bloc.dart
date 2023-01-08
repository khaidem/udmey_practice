import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/todo.model.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListStateBloc> {
  TodoListBloc() : super(TodoListStateBloc.initial()) {
    on<AddTodoEvent>(_addTodo);
    on<EditTodoEvent>(_editTodo);
    on<ToggleTodoEvent>(_toggleTodo);
    on<RemoveTodoEvent>(_removeTodo);
  }
  void _addTodo(AddTodoEvent event, Emitter<TodoListStateBloc> emit) {
    final newTodo = Todo(desc: event.todoDesc);
    final newTodos = [...state.todos, newTodo];
    emit(state.copyWith(todos: newTodos));
  }

  void _editTodo(EditTodoEvent event, Emitter<TodoListStateBloc> emit) {
    final newTodos = state.todos.map((Todo todos) {
      if (todos.id == event.id) {
        return Todo(
            id: event.id, desc: event.todoDesc, completed: todos.completed);
      }
      return todos;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void _toggleTodo(ToggleTodoEvent event, Emitter<TodoListStateBloc> emit) {
    final newTodos = state.todos.map((Todo todos) {
      if (todos.id == event.id) {
        return Todo(
            id: event.id, desc: todos.desc, completed: !todos.completed);
      }
      return todos;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void _removeTodo(RemoveTodoEvent event, Emitter<TodoListStateBloc> emit) {
    final newTodos =
        state.todos.where((Todo t) => t.id != event.todo.id).toList();
    emit(state.copyWith(todos: newTodos));
  }
}
