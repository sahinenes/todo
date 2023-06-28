import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/init/theme/app_theme.dart';
import 'package:todo/product/init.dart';
import 'package:todo/view/add/controller/add_controller.dart';
import 'package:todo/view/home/view/home_view.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoNotifier(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'todo',
        theme: AppTheme.instance.apptheme,
        home: const HomeView(),
      ),
    );
  }
}
