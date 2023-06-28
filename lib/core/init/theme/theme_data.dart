import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_schemes.g.dart';

ThemeData get themeApp => ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.openSansTextTheme(),
      colorScheme: lightColorScheme,
      appBarTheme: appBarTheme,
      
      /* navigationBarTheme: navigationBarThemeData,
    cardTheme: cardTheme,
    drawerTheme: drawerThemeData,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,
    listTileTheme: listTileThemeData,
    snackBarTheme: snackBarThemeData,
    timePickerTheme: timePickerThemeData,
    dividerColor: lightColorScheme.secondary,
    dividerTheme: dividerThemeData,
    iconTheme: iconThemeData
    
    */
    );

IconThemeData get iconThemeData {
  return const IconThemeData(size: 24);
}

AppBarTheme get appBarTheme {
  return AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: lightColorScheme.background,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      /*    systemNavigationBarColor: Color(0xFFF8FDFF),
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Color(0xFFF8FDFF),
        systemNavigationBarContrastEnforced: true,
        systemStatusBarContrastEnforced: true*/
    ),
    toolbarHeight: 64,
    scrolledUnderElevation: 0,
    elevation: 0,
    color: lightColorScheme.background,
    foregroundColor: lightColorScheme.background,
  

    //color: const  Color.fromRGBO(245, 245, 245, 1),
    //surfaceTintColor: const Color.fromRGBO(245, 245, 245, 1),
    //foregroundColor:const  Color.fromRGBO(245, 245, 245, 1),
  );
}


/*
NavigationBarThemeData get navigationBarThemeData {
  return NavigationBarThemeData(
    height: 80,
    indicatorColor: lightColorScheme.background,
    labelTextStyle: MaterialStateProperty.all(TextStyle(
      fontFamily: ApplicationConstants.FONT_FAMILY,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: lightColorScheme.onSurface,
    )),
    elevation: 2,
    iconTheme: MaterialStateProperty.all(const IconThemeData(size: 24)),
  );
}

CardTheme get cardTheme {
  return CardTheme(
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width: 1,
        color: lightColorScheme.background,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 1,
  );
}

ListTileThemeData get listTileThemeData {
  return ListTileThemeData(
    tileColor: lightColorScheme.background,
    iconColor: lightColorScheme.secondary,
    textColor: lightColorScheme.onSurface,
    dense: true,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width: 1,
        color: lightColorScheme.background,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

SnackBarThemeData get snackBarThemeData {
  return SnackBarThemeData(
      contentTextStyle: TextStyle(
          color: lightColorScheme.onInverseSurface,
          fontFamily: ApplicationConstants.FONT_FAMILY,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.5),
      elevation: 3,
      actionTextColor: lightColorScheme.inversePrimary,
      behavior: SnackBarBehavior.floating,
      backgroundColor: lightColorScheme.inverseSurface,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))));
}

TimePickerThemeData get timePickerThemeData {
  return TimePickerThemeData(
    hourMinuteShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    hourMinuteColor: lightColorScheme.tertiaryContainer,
    hourMinuteTextColor: lightColorScheme.onTertiaryContainer,
    dayPeriodShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    hourMinuteTextStyle: TextStyle(
        color: lightColorScheme.surface, fontFamily: ApplicationConstants.FONT_FAMILY, fontWeight: FontWeight.w500, fontSize: 25, letterSpacing: 0.5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    backgroundColor: lightColorScheme.surface,
    helpTextStyle: TextStyle(
        color: lightColorScheme.onSurfaceVariant,
        fontFamily: ApplicationConstants.FONT_FAMILY,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        letterSpacing: 0.5),
  );
}

DividerThemeData get dividerThemeData {
  return  DividerThemeData(
    color: lightColorScheme.secondary,
  );
}

DrawerThemeData get drawerThemeData {
  return const DrawerThemeData(scrimColor:  Color.fromRGBO(245, 245, 245, 0.1),
    backgroundColor: Color.fromRGBO(245, 245, 245, 1),
    elevation: 0,
  );
}*/
