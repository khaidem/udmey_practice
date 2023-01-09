import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/todo.model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String todoDesc) {
    final newTodo = Todo(desc: todoDesc);
    //Use Spreate operator of the list todoList to create new todo list and store in new todo
    final newTodos = [...state.todos, newTodo];
    emit(state.copyWith(todos: newTodos));
    log(state.toString());
  }

  void editTodo(String id, String todoDesc) {
    final newTodo = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(id: id, desc: todoDesc, completed: todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodo));
  }

  void toogleTodo(String id) {
    final newTodos = state.todos.map((Todo todos) {
      if (todos.id == id) {
        return Todo(id: id, desc: todos.desc, completed: !todos.completed);
      }
      return todos;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void removeTodo(Todo todo) {
    final newTodos = state.todos.where((Todo t) => t.id != todo.id).toList();
    emit(state.copyWith(todos: newTodos));
  }
}
