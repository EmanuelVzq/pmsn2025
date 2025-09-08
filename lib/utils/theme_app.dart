import 'package:flutter/material.dart';

class ThemeApp {
    static ThemeData darkTheme(){
      final theme = ThemeData.dark().copyWith(
        colorScheme: ColorScheme(
          brightness: Brightness.dark, 
          primary: Colors.grey , 
          onPrimary: Colors.blueGrey, 
          secondary: Colors.amber, 
          onSecondary: Colors.redAccent, 
          error: Colors.red, 
          onError: Colors.red, 
          surface: const Color.fromARGB(255, 0, 0, 0), 
          onSurface: const Color.fromARGB(255, 255, 255, 255)
        )
      );
      return theme;
    }

    static ThemeData lightTheme(){
      final theme = ThemeData.light().copyWith(
        colorScheme: ColorScheme(
          brightness: Brightness.dark, 
          primary: Colors.white , 
          onPrimary: Colors.blue, 
          secondary: Colors.pink, 
          onSecondary: Colors.pink, 
          error: Colors.purple, 
          onError: Colors.purpleAccent, 
          surface: Colors.greenAccent, 
          onSurface: Colors.grey
        )
      );
      return theme;
    }
}