import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/todo.model.dart';

part 'todo_filter_event.dart';
part 'todo_filter_state.dart';

class TodoFilterBloc extends Bloc<TodoFilterEvent, TodoFilterState> {
  TodoFilterBloc() : super(TodoFilterState.initial()) {
    on<ChangeFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
  }
}
