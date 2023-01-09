import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/bloc.dart';
import '../model/todo.model.dart';

class ShowTodoPage extends StatelessWidget {
  const ShowTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //**For Bloc */
    final todo = context.watch<FliteredTodoBloc>().state.filterTodos;

    //**For Cubit */
    // final todo = context.watch<FliterTodoCubit>().state.filterTodos;
    List<Todo> setFilterTodo(
        SearchFilter filter, List<Todo> todos, String searchTerm) {
      List<Todo> _filterTodos;

      switch (filter) {
        case SearchFilter.active:
          _filterTodos = todos.where((Todo todo) => !todo.completed).toList();

          break;

        case SearchFilter.all:
          _filterTodos = todos;
          break;
        case SearchFilter.completed:
          _filterTodos = todos.where((Todo todo) => !todo.completed).toList();
          break;
      }
      if (searchTerm.isNotEmpty) {
        _filterTodos = _filterTodos
            .where((Todo todo) => todo.desc.toLowerCase().contains(searchTerm))
            .toList();
      }
      return _filterTodos;
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<TodoListBloc, TodoListStateBloc>(
          listener: (context, state) {
            final filteredTodos = setFilterTodo(
                context.read<TodoFilterBloc>().state.filter,
                state.todos,
                context.read<TodoSearchBloc>().state.searchItem);
            context
                .read<FliteredTodoBloc>()
                .add(CalculatedFilterTodosEvent(filteredTodos: filteredTodos));

            BlocListener<TodoFilterBloc, TodoFilterState>(
              listener: (context, state) {
                final filteredTodos = setFilterTodo(
                    state.filter,
                    context.read<TodoListBloc>().state.todos,
                    context.read<TodoSearchBloc>().state.searchItem);
                context.read<FliteredTodoBloc>().add(
                    CalculatedFilterTodosEvent(filteredTodos: filteredTodos));
              },
            );
            BlocListener<TodoSearchBloc, TodoSearchState>(
              listener: (context, state) {
                final filteredTodos = setFilterTodo(
                    context.read<TodoFilterBloc>().state.filter,
                    context.read<TodoListBloc>().state.todos,
                    state.searchItem);
                context.read<FliteredTodoBloc>().add(
                    CalculatedFilterTodosEvent(filteredTodos: filteredTodos));
              },
            );
          },
        ),
      ],
      child: ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                background: showBackground(0),
                secondaryBackground: showBackground(1),
                onDismissed: (_) {
                  //** For Bloc */
                  context
                      .read<TodoListBloc>()
                      .add(RemoveTodoEvent(todo: todo[index]));

                  //**For Cubit */
                  // context.read<TodoListCubit>().removeTodo(todo[index]);
                },
                confirmDismiss: (_) {
                  return showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Are you sure?'),
                          actions: [
                            TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text('No')),
                            TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text('yes'))
                          ],
                        );
                      });
                },
                key: ValueKey(todo[index].id),
                child: TodoItem(todo: todo[index]));
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.grey,
            );
          },
          itemCount: todo.length),
    );
  }
}

///** When we listen multiple Cubit we use MultiBlocListner */
//     return MultiBlocListener(
//       listeners: const [
//         //**For cubit  */
//         // BlocListener<TodoListCubit, TodoListState>(
//         //   listener: (context, state) {
//         //     context.read<FliterTodoCubit>().setFilterTodo(
//         //         context.read<TodoFilterCubit>().state.filter,
//         //         state.todos,
//         //         context.read<TodoSearchFilterCubit>().state.searchItem);
//         //   },
//         // ),
//         // BlocListener<TodoFilterCubit, TodoFilterState>(
//         //   listener: (context, state) {
//         //     context.read<FliterTodoCubit>().setFilterTodo(
//         //         state.filter,
//         //         context.read<TodoListCubit>().state.todos,
//         //         context.read<TodoSearchFilterCubit>().state.searchItem);
//         //   },
//         // ),
//         // BlocListener<TodoSearchFilterCubit, TodoSearchFilterState>(
//         //   listener: (context, state) {
//         //     context.read<FliterTodoCubit>().setFilterTodo(
//         //         context.read<TodoFilterCubit>().state.filter,
//         //         context.read<TodoListCubit>().state.todos,
//         //         state.searchItem);
//         //   },
//         // ),
//       ],
//       child: ListView.separated(
//           primary: false,
//           shrinkWrap: true,
//           itemBuilder: (BuildContext context, int index) {
//             return Dismissible(
//                 background: showBackground(0),
//                 secondaryBackground: showBackground(1),
//                 onDismissed: (_) {
//                   //** For Bloc */
//                   context
//                       .read<TodoListBloc>()
//                       .add(RemoveTodoEvent(todo: todo[index]));

//                   //**For Cubit */
//                   // context.read<TodoListCubit>().removeTodo(todo[index]);
//                 },
//                 confirmDismiss: (_) {
//                   return showDialog(
//                       context: context,
//                       barrierDismissible: false,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: const Text('Are you sure?'),
//                           actions: [
//                             TextButton(
//                                 onPressed: () =>
//                                     Navigator.of(context).pop(false),
//                                 child: const Text('No')),
//                             TextButton(
//                                 onPressed: () =>
//                                     Navigator.of(context).pop(true),
//                                 child: const Text('yes'))
//                           ],
//                         );
//                       });
//                 },
//                 key: ValueKey(todo[index].id),
//                 child: TodoItem(todo: todo[index]));
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             return const Divider(
//               color: Colors.grey,
//             );
//           },
//           itemCount: todo.length),
//     );
//   }
// }

Widget showBackground(int direction) {
  return Container(
    margin: const EdgeInsets.all(4),
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    color: Colors.red,
    alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
    child: const Icon(
      Icons.delete,
      size: 30.0,
      color: Colors.white,
    ),
  );
}

class TodoItem extends StatefulWidget {
  const TodoItem({Key? key, required this.todo}) : super(key: key);
  final Todo todo;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              bool _error = false;
              textEditingController.text = widget.todo.desc;
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return AlertDialog(
                    content: TextField(
                      controller: textEditingController,
                      autofocus: true,
                      decoration: InputDecoration(
                          errorText: _error ? 'Value can not empty' : null),
                    ),
                    actions: [
                      TextButton(onPressed: () {}, child: const Text('Cancel')),
                      TextButton(
                          onPressed: () {
                            _error = textEditingController.text.isEmpty
                                ? true
                                : false;
                            if (!_error) {
                              // **For Bloc */
                              context.read<TodoListBloc>().add(EditTodoEvent(
                                  id: widget.todo.id,
                                  todoDesc: textEditingController.text));

                              //**For Cubit */
                              // context.read<TodoListCubit>().editTodo(
                              //     widget.todo.id, textEditingController.text);
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text('Edit'))
                    ],
                  );
                },
              );
            });
      },
      leading: Checkbox(
          value: widget.todo.completed,
          onChanged: (bool? checked) {
            //**For Bloc */
            context
                .read<TodoListBloc>()
                .add(ToggleTodoEvent(id: widget.todo.id));
            //**For Cubit */
            // context.read<TodoListCubit>().toogleTodo(widget.todo.id);
          }),
      title: Text(widget.todo.desc),
    );
  }
}
