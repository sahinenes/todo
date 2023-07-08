import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/constants/image/image_constants.dart';
import 'package:todo/core/extension/context_extension.dart';
import 'package:todo/core/extension/date_extension.dart';
import 'package:todo/product/models/todo_model.dart';
import 'package:todo/product/widgets/lists/listview_widget.dart';
import 'package:todo/view/add/view/add_view.dart';
import '../../../product/variables/database_variables.dart';
import 'package:todo/product/controllers/todo_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _floatingActionButton(context),
        appBar: _appBar(context),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<TodoNotifier>(
            builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(context, value),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  _todayList(context),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Text(
                    "Tomorrow",
                    style: context.textTheme.titleLarge!
                        .copyWith(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  _tomorrowList(context)
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: context.colors.scrim,
      foregroundColor: context.colors.background,
      child: const Icon(
        Icons.add,
        size: 24,
      ),
      onPressed: () => showModalBottomSheet<void>(
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (BuildContext context) {
            return const AddView();
          }),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(elevation: 0, actions: [
      CircleAvatar(
        foregroundImage: AssetImage(ImageConstants.instance.person),
      ),
      SizedBox(
        width: context.width * 0.01,
      )
    ]);
  }

  Widget _todayList(BuildContext context) {
    final controller = Provider.of<TodoNotifier>(context, listen: false);
    return Consumer<TodoNotifier>(
      builder: (context, value, child) {
        return value.showDone ? _todayDone(controller) : _todayAll(controller);
      },
    );
  }

  ValueListenableBuilder<Box<Todo>> _todayDone(TodoNotifier controller) {
    return ValueListenableBuilder<Box<Todo>>(
      valueListenable: todoBox.listenable(),
      builder: (context, Box<Todo> box, child) {
        List<int>? keys;
        keys = todoBox.keys
            .cast<int>()
            .where((key) =>
                todoBox.get(key)!.today == true &&
                todoBox.get(key)!.done == false)
            .toList();
        if (keys != null) {
          return ListviewWidget(
            itemCount: keys.length,
            itemBuilder: (context, index) {
              int? key = keys![index];
              Todo model = todoBox.get(key)!;

              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: model.done,
                onChanged: (value) {
                  Todo todo = Todo(
                      todo: model.todo,
                      hour: model.hour,
                      today: model.today,
                      done: value);
                  controller.update(key, todo);
                },
                title: Text(
                  model.todo ?? "",
                  style: context.textTheme.bodyLarge,
                ),
                subtitle: Text(
                  model.hour!.dateToStringWithFormat(format: 'dd/MM/yy HH:mm'),
                  style: context.textTheme.bodySmall,
                ),
              );
            },
          );
        } else {
          return const Placeholder();
        }
      },
    );
  }

  ValueListenableBuilder<Box<Todo>> _todayAll(TodoNotifier controller) {
    return ValueListenableBuilder<Box<Todo>>(
      valueListenable: todoBox.listenable(),
      builder: (context, Box<Todo> box, child) {
        List<int>? keys;
        keys = todoBox.keys
            .cast<int>()
            .where((key) => todoBox.get(key)!.today == true)
            .toList();
        if (keys != null) {
          return ListviewWidget(
            itemCount: keys.length,
            itemBuilder: (context, index) {
              int? key = keys![index];
              Todo model = todoBox.get(key)!;

              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: model.done,
                onChanged: (value) {
                  Todo todo = Todo(
                      todo: model.todo,
                      hour: model.hour,
                      today: model.today,
                      done: value);
                  controller.update(key, todo);
                },
                title: Text(
                  model.todo ?? "",
                  style: context.textTheme.bodyLarge,
                ),
                subtitle: Text(
                  model.hour!.dateToStringWithFormat(format: 'dd/MM/yy HH:mm'),
                  style: context.textTheme.bodySmall,
                ),
              );
            },
          );
        } else {
          return const Placeholder();
        }
      },
    );
  }

  ValueListenableBuilder<Box<Todo>> _tomorrowList(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: todoBox.listenable(),
      builder: (context, Box<Todo> box, child) {
        List<int>? keys;
        keys = todoBox.keys
            .cast<int>()
            .where((key) => todoBox.get(key)!.today == false)
            .toList();
        if (keys != null) {
          return ListviewWidget(
            itemCount: keys.length,
            itemBuilder: (context, index) {
              int? key = keys![index];
              Todo model = todoBox.get(key)!;

              return ListTile(
                leading: Column(
                  children: [
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: context.width * 0.02,
                      height: context.width * 0.02,
                      decoration: BoxDecoration(
                          color: context.colors.scrim, shape: BoxShape.circle),
                    ),
                  ],
                ),
                title: Text(
                  model.todo ?? "",
                  style: context.textTheme.bodyLarge,
                ),
                subtitle: Text(
                  model.hour!.dateToStringWithFormat(format: 'dd/MM/yy HH:mm'),
                  style: context.textTheme.bodySmall,
                ),
              );
            },
          );
        } else {
          return const Placeholder();
        }
      },
    );
  }

  Row _header(BuildContext context, TodoNotifier controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today",
          style: context.textTheme.titleLarge!
              .copyWith(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            controller.setShowDone = !controller.showDone;
          },
          child: Text(
            controller.showDone ? "Show completed" : "Hide completed",
            style: context.textTheme.titleMedium!
                .copyWith(color: context.colors.primary),
          ),
        ),
      ],
    );
  }
}
