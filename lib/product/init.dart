import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/core/constants/app/app_constants.dart';
import 'package:todo/product/models/todo_model.dart';

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>(ApplicationConstants.TODO_BOX);
}
