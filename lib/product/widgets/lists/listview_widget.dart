import 'package:flutter/material.dart';

class ListviewWidget extends StatelessWidget {
  const ListviewWidget({
    super.key,
    this.flex = 1,
    this.itemCount = 0,
    required this.itemBuilder,
  });
  final int flex;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: ListView.builder(itemCount: itemCount, itemBuilder: itemBuilder),
    );
  }
}
