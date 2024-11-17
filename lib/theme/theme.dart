import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.yellow[600],
      scaffoldBackgroundColor: Colors.black,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.yellow[600],
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(
        labelLarge: TextStyle(color: Colors.white, fontSize: 20),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow[600],
          textStyle: TextStyle(fontSize: 18),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.yellow[600],
        foregroundColor: Colors.black, // Texte noir dans l'AppBar
      ),
    );
  }
}
