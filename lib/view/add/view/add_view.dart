// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/extension/context_extension.dart';
import 'package:todo/product/models/todo_model.dart';

import 'package:todo/product/controllers/todo_controller.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

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
            _today(context),
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
                  onPressed: () async {
                    if (controller.name.text != "") {
                      Todo todo = Todo(
                          todo: controller.name.text,
                          hour: controller.hour,
                          today: controller.today);

                      try {
                        await controller.add(todo);
                        controller.name.clear();

                        controller.setToday = false;
                        Navigator.pop(context);
                        //showSnackbarTop(context, "Task added.");
                      } catch (e) {
                        // showSnackbarTop(context, "We have a problem.");
                      }
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

  Row _today(BuildContext context) {
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
              value: context.watch<TodoNotifier>().today ?? false,
              onChanged: (bool value) {
                context.read<TodoNotifier>().setToday = value;
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
        context.read<TodoNotifier>().setHour = time;
      },
    );
  }

  Widget _name(BuildContext context) {
    return Consumer<TodoNotifier>(
      builder: (context, value, child) => Row(
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
              controller: value.name,
              style: context.textTheme.bodyMedium,
              decoration: InputDecoration(
                  hintStyle: context.textTheme.bodySmall,
                  labelStyle: context.textTheme.bodyMedium,
                  hintText: "Write a task"),
            ),
          ),
        ],
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text("Add a task", style: context.textTheme.titleLarge);
  }
}
