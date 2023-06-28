import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../init/theme/app_theme.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => AppTheme.instance.apptheme;
  TextTheme get textTheme => GoogleFonts.openSansTextTheme().copyWith(
        bodySmall: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            
            wordSpacing: 0.4),
        bodyMedium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
         
            wordSpacing: 0.25),
        bodyLarge: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          
            wordSpacing: 0.5),
        labelSmall: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w200,
            
            wordSpacing: 0.5),
        labelMedium: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w200,
            
            wordSpacing: 0.5),
        labelLarge: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
           
            wordSpacing: 0),
        titleSmall: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w200,
      
            wordSpacing: 0.1),
        titleMedium: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w200,
        
            wordSpacing: 0.15),
        titleLarge: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w200,
      
            wordSpacing: 0),
        headlineSmall: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
        
            wordSpacing: 0),
        headlineMedium: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.normal,
         
            wordSpacing: 0.5),
        headlineLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.normal,
        
            wordSpacing: 0),
      );

  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
}
