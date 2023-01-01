import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_search_filter_state.dart';

class TodoSearchFilterCubit extends Cubit<TodoSearchFilterState> {
  TodoSearchFilterCubit() : super(TodoSearchFilterState.initial());

  void setSearch(String newSearch) {
    emit(state.copyWith(searchItem: newSearch));
  }
}
