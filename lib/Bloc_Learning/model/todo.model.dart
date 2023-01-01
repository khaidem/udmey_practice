import 'package:uuid/uuid.dart';

enum SearchFilter { all, completed, active }

Uuid uuid = const Uuid();

class Todo {
  final String id;
  final String desc;
  final bool completed;

  Todo({String? id, required this.desc, this.completed = false})
      : id = id ?? uuid.v4();

  List<Object> get props => [id, desc, completed];
  @override
  String toString() => 'Todo(id : $id, desc: $desc, completed: $completed)';
}
