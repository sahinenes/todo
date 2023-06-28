import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  String? todo;

  @HiveField(1)
  String? hour;

  @HiveField(2)
  bool? tomorrow;

   Todo({required this.todo,required this.hour,required this.tomorrow});

}
