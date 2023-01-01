import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/Bloc_Learning/cubit/filter_todo/fliter_todo_cubit.dart';
import 'package:practice_app/Bloc_Learning/cubit/todo_list/todo_list_cubit.dart';
import 'package:practice_app/Bloc_Learning/model/todo.model.dart';

class ShowTodoPage extends StatelessWidget {
  const ShowTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo = context.watch<FliterTodoCubit>().state.filterTodos;
    return ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              background: showBackground(0),
              secondaryBackground: showBackground(1),
              onDismissed: (_) {
                context.read<TodoListCubit>().removeTodo(todo[index]);
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
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('No')),
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
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
        itemCount: todo.length);
  }
}

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
                              context.read<TodoListCubit>().editTodo(
                                  widget.todo.id, textEditingController.text);
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
            context.read<TodoListCubit>().toogleTodo(widget.todo.id);
          }),
      title: Text(widget.todo.desc),
    );
  }
}
