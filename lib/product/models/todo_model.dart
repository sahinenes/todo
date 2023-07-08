import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  String? todo;

  @HiveField(1)
  DateTime? hour;

  @HiveField(2)
  bool? today;

  @HiveField(3)
  bool? done;
  Todo(
      {required this.todo,
      required this.hour,
      required this.today,
      this.done = false});
}
