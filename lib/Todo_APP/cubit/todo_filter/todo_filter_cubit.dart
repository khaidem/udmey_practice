import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/todo.model.dart';

part 'todo_filter_state.dart';

class TodoFilterCubit extends Cubit<TodoFilterState> {
  TodoFilterCubit() : super(TodoFilterState.initial());
  void changeFilter(SearchFilter newfilter) {
    emit(state.copyWith(filter: newfilter));
  }
}
