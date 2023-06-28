import 'package:flutter/material.dart';
import 'package:todo/core/init/theme/theme_data.dart';

class AppTheme {
  AppTheme._init();
  static AppTheme? _instance;
  static AppTheme get instance {
    _instance ??= AppTheme._init();
    return _instance!;
  }

  ThemeData apptheme = themeApp;
}
