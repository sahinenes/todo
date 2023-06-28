import 'package:flutter/material.dart';
import 'package:todo/product/models/todo_model.dart';
import 'package:todo/product/variables/database_variables.dart';

class TodoNotifier extends ChangeNotifier {
  bool loading = false;

  String? todo = "";
  String? hour = "";
  bool? tomorrow = false;

  get getTodo => todo;

  set setTodo(todo) {
    this.todo = todo;
    notifyListeners();
  }

  get getHour => hour;

  set setHour(hour) {
    this.hour = hour;
    notifyListeners();
  }

  get getTomorrow => tomorrow;

  set setTomorrow(tomorrow) {
    this.tomorrow = tomorrow;
    notifyListeners();
  }

  Future<int> add(Todo model) async {
    int state = 1;
    await todoBox.add(model).onError((error, stackTrace) => state = 0);
    notifyListeners();
    return state;
  }

  Future<bool> delete(dynamic key) async {
    bool state = true;
    await todoBox.delete(key).onError((error, stackTrace) => state = false);
    notifyListeners();
    return state;
  }

  Future<bool> update(dynamic key, Todo model) async {
    bool state = true;
    await todoBox.put(key, model).onError((error, stackTrace) => state = false);
    notifyListeners();
    return state;
  }

  Future<bool> deleteAll(dynamic keys) async {
    bool state = true;
    await todoBox.deleteAll(keys).onError((error, stackTrace) => state = false);
    notifyListeners();
    return state;
  }
}
