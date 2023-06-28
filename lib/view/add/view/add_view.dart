import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/extension/context_extension.dart';
import 'package:todo/core/extension/date_extension.dart';
import 'package:todo/product/models/todo_model.dart';
import 'package:todo/view/add/controller/add_controller.dart';

class AddView extends StatelessWidget {
  AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(context),
            SizedBox(
              height: context.height * 0.02,
            ),
            _name(context),
            SizedBox(
              height: context.height * 0.03,
            ),
            _hour(context),
            SizedBox(
              height: context.height * 0.03,
            ),
            _tomorrow(context),
            SizedBox(
              height: context.height * 0.04,
            ),
            _addButton(context),
          ],
        ),
      ),
    );
  }

  Container _addButton(BuildContext context) {
    final controller = Provider.of<TodoNotifier>(context, listen: false);
    return Container(
      width: context.width,
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
              width: context.width * 0.8,
              height: context.height * 0.05,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(context.colors.scrim),
                      foregroundColor:
                          MaterialStatePropertyAll(context.colors.background)),
                  onPressed: () {
                    if (controller.todo != null || controller.todo != "") {
                      Todo todo = Todo(
                          todo: controller.todo,
                          hour: controller.hour,
                          tomorrow: controller.tomorrow);
                      controller.add(todo);
                      name.clear();
                      context.read<TodoNotifier>().setTomorrow = false;
                    }
                  },
                  child: Text(
                    "DONE",
                    style: context.textTheme.displayMedium!
                        .copyWith(color: context.colors.background),
                  ))),
          SizedBox(
            height: context.height * 0.02,
          ),
          Text(
            "If you disable today, the task will be considered as tomorrow",
            style: context.textTheme.bodySmall,
          )
        ],
      ),
    );
  }

  Row _tomorrow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Today:",
          style: context.textTheme.bodyMedium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Consumer<TodoNotifier>(
            builder: (context, value, child) => Switch(
              value: context.watch<TodoNotifier>().tomorrow ?? false,
              onChanged: (bool value) {
                context.read<TodoNotifier>().setTomorrow = value;
              },
            ),
          ),
        ),
      ],
    );
  }

  Row _hour(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Hour:",
          style: context.textTheme.bodyMedium,
        ),
        SizedBox(
          width: context.width * 0.02,
        ),
        hourMinute12H(context),
      ],
    );
  }

  /// SAMPLE
  Widget hourMinute12H(BuildContext context) {
    return TimePickerSpinner(
      normalTextStyle: context.textTheme.bodySmall,
      highlightedTextStyle: context.textTheme.titleLarge,
      isForce2Digits: false,
      is24HourMode: false,
      itemHeight: context.height * 0.04,
      onTimeChange: (time) {
        context.read<TodoNotifier>().setHour =
            time.dateToStringWithFormat(format: 'hh:mm');
      },
    );
  }

  TextEditingController name = TextEditingController();
  Row _name(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Name:",
          style: context.textTheme.bodyMedium,
        ),
        SizedBox(
          width: context.width * 0.04,
        ),
        SizedBox(
          width: context.width * 0.7,
          child: TextField(
            onChanged: (value) {
              context.read<TodoNotifier>().setTodo = name.text;
            },
            onSubmitted: (value) =>
                context.read<TodoNotifier>().setTodo = name.text,
            onEditingComplete: () =>
                context.read<TodoNotifier>().setTodo = name.text,
            controller: name,
            style: context.textTheme.bodyMedium,
            decoration: InputDecoration(
                hintStyle: context.textTheme.bodySmall,
                labelStyle: context.textTheme.bodyMedium,
                hintText: "Write a task"),
          ),
        ),
      ],
    );
  }

  Text _title(BuildContext context) {
    return Text("Add a task", style: context.textTheme.titleLarge);
  }
}
