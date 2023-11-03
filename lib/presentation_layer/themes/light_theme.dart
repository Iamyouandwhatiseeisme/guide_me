import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: 'Telegraf',
    brightness: Brightness.light,
    appBarTheme:
        const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
    colorScheme: const ColorScheme.light(
        background: Color(0xffF3F0E6),
        primary: Color(0xffF3F0E6),
        secondary: Colors.grey));
