import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/todo_filter/todo_filter_bloc.dart';
import '../Bloc/todo_search/todo_search_bloc.dart';
import '../model/todo.model.dart';
import '../utils/debounce.dart';

class SearchAndFilterTodo extends StatelessWidget {
  SearchAndFilterTodo({Key? key}) : super(key: key);

  final debounce = Debounce(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
              labelText: 'Search todos',
              border: InputBorder.none,
              filled: true,
              prefixIcon: Icon(Icons.search)),
          onChanged: (String? newSearch) {
            if (newSearch != null) {
              debounce.run(() {
//**For Bloc */
                context
                    .read<TodoSearchBloc>()
                    .add(SetSearchTermEvent(newSerchTerm: newSearch));
                //**For Cubit */
                // context.read<TodoSearchFilterCubit>().setSearch(newSearch);
              });
            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            filterButton(context, SearchFilter.all),
            filterButton(context, SearchFilter.active),
            filterButton(context, SearchFilter.completed),
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, SearchFilter filter) {
    return TextButton(
      onPressed: () {
        //**for Bloc */
        context
            .read<TodoFilterBloc>()
            .add(ChangeFilterEvent(newFilter: filter));
        //**For Cubit */
        // context.read<TodoFilterCubit>().changeFilter(filter);
      },
      child: Text(
        filter == SearchFilter.all
            ? 'All'
            : filter == SearchFilter.active
                ? 'Active'
                : 'completed',
        style: TextStyle(color: textColor(context, filter)),
      ),
    );
  }
}

//Chnage color according to button click

Color textColor(BuildContext context, SearchFilter filter) {
  //**For Bloc */
  final currentFilter = context.watch<TodoFilterBloc>().state.filter;
  //** For Cubit */
  // final currentFilter = context.watch<TodoFilterCubit>().state.filter;
  return currentFilter == filter ? Colors.blue : Colors.grey;
}
