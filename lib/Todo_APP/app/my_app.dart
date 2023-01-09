import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/bloc.dart';
import '../cubit/cubit.dart';
import '../page/todo.page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoFilterBloc(),
        ),
        BlocProvider(
          create: (context) => TodoSearchBloc(),
        ),
        BlocProvider(
          create: (context) => TodoListBloc(),
        ),
        BlocProvider<ActiveTodoBloc>(
          create: (context) => ActiveTodoBloc(
            //** use For streamSubscription+Cubit */
            // todoListCubit: BlocProvider.of<TodoListCubit>(
            //   context,
            // ),
            initialActiveCount: context.read<TodoListBloc>().state.todos.length,

            //** For StreamSubscription */
            // todoListBloc: BlocProvider.of<TodoListBloc>(context),
          ),
        ),
        BlocProvider<FliteredTodoBloc>(
          create: (context) => FliteredTodoBloc(
            //** For StreamSubscription+Cubit use */
            // todoListCubit: BlocProvider.of<TodoListCubit>(
            //   context,
            // ),
            // todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
            // todoSearchFilterCubit:
            //     BlocProvider.of<TodoSearchFilterCubit>(context),
            initialTodo: context.read<TodoListCubit>().state.todos,

            //**For StreamSubscription */
            // todoFilterBloc: BlocProvider.of<TodoFilterBloc>(context),
            // todoListBloc: BlocProvider.of<TodoListBloc>(context),
            // todoSearchFilterBloc: BlocProvider.of<TodoSearchBloc>(context),
          ),
        ),
        BlocProvider(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider(
          create: (context) => TodoSearchFilterCubit(),
        ),
        BlocProvider(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<ActiveTodoCubit>(
          create: (context) => ActiveTodoCubit(
            //** use For streamSubscription+Cubit */
            // todoListCubit: BlocProvider.of<TodoListCubit>(
            //   context,
            // ),
            initialActiveCount:
                context.read<TodoListCubit>().state.todos.length,
          ),
        ),
        BlocProvider<FliterTodoCubit>(
          create: (context) => FliterTodoCubit(
            //** For StreamSubscription+Cubit use */
            // todoListCubit: BlocProvider.of<TodoListCubit>(
            //   context,
            // ),
            // todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
            // todoSearchFilterCubit:
            //     BlocProvider.of<TodoSearchFilterCubit>(context),
            initialTodo: context.read<TodoListCubit>().state.todos,
          ),
        )
      ],
      child: MaterialApp(
        title: 'TODO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const TodoPage(),
      ),
    );
  }
}
