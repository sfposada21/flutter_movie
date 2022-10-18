import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Colors.purple;
  static final ThemeData lightTheme = ThemeData.light().copyWith(

    // Color primario
    primaryColor: Colors.purple,
        
    // AppBar Theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 5
    ),   


  );

}