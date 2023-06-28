import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/extension/context_extension.dart';
import 'package:todo/product/models/todo_model.dart';
import 'package:todo/product/widgets/lists/listview_widget.dart';
import 'package:todo/view/add/controller/add_controller.dart';
import 'package:todo/view/add/view/add_view.dart';

import '../../../product/variables/database_variables.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.small(
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
                return AddView();
              }),
        ),
        appBar: AppBar(elevation: 0, actions: [
          const CircleAvatar(
            foregroundImage: NetworkImage(
                "data:image/jpeg;base64,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"),
          ),
          SizedBox(
            width: context.width * 0.01,
          )
        ]),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),
              SizedBox(
                height: context.height * 0.05,
              ),
              _todayList(context),
              SizedBox(
                height: context.height * 0.01,
              ),
              Text(
                "Tomorrow",
                style: context.textTheme.titleLarge,
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              _tomorrowList(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _todayList(BuildContext context) {
    final controller = Provider.of<TodoNotifier>(context, listen: false);
    return Consumer<TodoNotifier>(
      builder: (context, value, child) {
        return ValueListenableBuilder<Box<Todo>>(
          valueListenable: todoBox.listenable(),
          builder: (context, Box<Todo> box, child) {
            List<int>? keys;
            keys = todoBox.keys
                .cast<int>()
                .where((key) => todoBox.get(key)!.tomorrow == false)
                .toList();
            if (keys != null) {
              return ListviewWidget(
                itemCount: keys.length,
                itemBuilder: (context, index) {
                  int? key = keys![index];
                  Todo model = todoBox.get(key)!;

                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: false,
                    onChanged: (value) {
                      controller.delete(key);
                    },
                    title: Text(
                      model.todo ?? "",
                      style: context.textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      model.hour ?? "",
                    ),
                  );
                },
              );
            } else {
              return const Placeholder();
            }
          },
        );
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
            .where((key) => todoBox.get(key)!.tomorrow == true)
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
                  style: context.textTheme.bodyMedium,
                ),
                subtitle: Text(
                  model.hour ?? "",
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

  Row _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Today",
          style: context.textTheme.titleLarge,
        ),
        Text(
          "Hide completed",
          style: context.textTheme.titleSmall!
              .copyWith(color: context.colors.primary),
        ),
      ],
    );
  }
}
