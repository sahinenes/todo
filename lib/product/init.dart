import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/core/constants/app/app_constants.dart';
import 'package:todo/product/models/todo_model.dart';
import 'package:todo/product/variables/database_variables.dart';

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>(ApplicationConstants.TODO_BOX);
  await deleteOldData();
}

Future<void> deleteOldData() async {
  DateTime now = DateTime.now();
  for (int i = 0; i < todoBox.keys.length; i++) {
    Todo? todo = todoBox.getAt(i);
    if ((todo?.hour?.day != now.day) && (todo?.hour?.day != (now.day + 1))) {
      todoBox.deleteAt(i);
    }
  }
}
