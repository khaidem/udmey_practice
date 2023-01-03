import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_search_event.dart';
part 'todo_search_state.dart';

class TodoSearchBloc extends Bloc<TodoSearchEvent, TodoSearchState> {
  TodoSearchBloc() : super(TodoSearchState.initial()) {
    on<SetSearchTermEvent>(
      (event, emit) {
        emit(state.copyWith(searchItem: event.newSerchTerm));
      },
    );
  }
  // EventTransformer<SetSearchTermEvent> debounce<SetSearchTermEvent>(
  //     Duration duration) {
  //   return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  // }
}
