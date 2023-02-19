import 'package:flutter/material.dart';

class Mythemes{
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[900],
    platform: TargetPlatform.iOS,
    colorScheme: ColorScheme.dark(),
      fontFamily: 'Sora-medium',
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
      backgroundColor: Color.fromRGBO(27, 27, 27,1)
    ),
    accentColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white)
  );
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.light(),
    platform: TargetPlatform.iOS,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black)
    ),
    fontFamily: 'Sora-medium',
    accentColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: Colors.white
  );
}