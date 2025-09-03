import 'package:flutter/material.dart';
import 'package:pmsn2025/screens/home_screen.dart';
import 'package:pmsn2025/screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      routes: {
        "/home" : (context) => HomeScreen()
      },
      title: 'Material App',
      home: LoginScreen(),
    );
  }
}