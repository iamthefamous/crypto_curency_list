import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
    primarySwatch: Colors.yellow,
    dividerColor: Colors.white24,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme:  TextTheme(
      bodyMedium: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      labelSmall: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
    )
);