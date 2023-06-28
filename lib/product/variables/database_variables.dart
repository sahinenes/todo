import 'package:hive/hive.dart';
import 'package:todo/core/constants/app/app_constants.dart';
import 'package:todo/product/models/todo_model.dart';

final Box<Todo> todoBox = Hive.box<Todo>(ApplicationConstants.TODO_BOX);
