import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practice_app/Bloc_Learning/model/todo.model.dart';

part 'todo_filter_state.dart';

class TodoFilterCubit extends Cubit<TodoFilterState> {
  TodoFilterCubit() : super(TodoFilterState.initial());
  void changeFilter(SearchFilter newfilter) {
    emit(state.copyWith(filter: newfilter));
  }
}
