import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/Todo_APP/page/show_todo.page.dart';

import '../Bloc/bloc.dart';
import '../model/todo.model.dart';
import 'create_todo.page.dart';
import 'search_and_filter_todo.page.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const TodoHeader(),
              const CreateTodoPage(),
              const SizedBox(
                height: 20,
              ),
              SearchAndFilterTodo(),
              const ShowTodoPage()
            ],
          ),
        ),
      ),
    );
  }
}

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Todo',
          style: TextStyle(fontSize: 40),
        ),

        //** For Showing Bloc to ui */
        BlocListener<TodoListBloc, TodoListStateBloc>(
          listener: (context, state) {
            final int activeTodoCount = state.todos
                .where((Todo todos) => !todos.completed)
                .toList()
                .length;
            context.read<ActiveTodoBloc>().add(CalculateActiveTodoCountEvent(
                activeTodoCount: activeTodoCount));
          },
          child: BlocBuilder<ActiveTodoBloc, ActiveTodoCountState>(
            builder: (context, state) {
              return Text('${state.activeTodoCount} item left');
            },
          ),
        )
        //How many item is rebuild again changes. we can retrive the value form that
        //Cubit when ever the value changes here
        // 2 method ==> BlocBuilder or extension method
        ///**For Listning data change in Cubit using BlocListner */
        ////** First Method */
        ///** For Cubit show in Ui */
        // BlocListener<TodoListCubit, TodoListState>(
        //   listener: (context, state) {
        //     final int activeCount = state.todos
        //         .where((Todo todo) => !todo.completed)
        //         .toList()
        //         .length;
        //     context
        //         .read<ActiveTodoCubit>()
        //         .calculateActiveTodoCubit(activeCount);
        //   },
        //   child: BlocBuilder<ActiveTodoCubit, ActiveTodoState>(
        //     builder: (context, state) {
        //       return Text('${state.activeTodoCount} item left');
        //     },
        //   ),
        // )

        //** Second Method */
        // Text(
        //     "${context.watch<ActiveTodoCubit>().state.activeTodoCount} Item Left")
      ],
    );
  }
}
