
import 'package:flutter/material.dart';

final ThemeData mainTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.red,
  accentColor: Colors.redAccent,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.redAccent),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide()
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(color: Colors.redAccent),
    ),
  )
);
