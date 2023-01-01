import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/Bloc_Learning/cubit/cubit.dart';
import 'package:practice_app/Bloc_Learning/model/todo.model.dart';

class SearchAndFilterTodo extends StatelessWidget {
  const SearchAndFilterTodo({Key? key}) : super(key: key);

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
              context.read<TodoSearchFilterCubit>().setSearch(newSearch);
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
        context.read<TodoFilterCubit>().changeFilter(filter);
      },
      child: Text(filter == SearchFilter.all
          ? 'All'
          : filter == SearchFilter.active
              ? 'Active'
              : 'completed'),
    );
  }
}

Color textColor(BuildContext context, SearchFilter filter) {
  final currentFilter = context.watch<TodoFilterCubit>().state.filter;
  return currentFilter == filter ? Colors.blue : Colors.grey;
}
