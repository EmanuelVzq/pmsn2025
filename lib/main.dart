import 'package:flutter/material.dart';
import 'package:pmsn2025/screens/challenge_detail.dart';
import 'package:pmsn2025/screens/home_screen.dart';
import 'package:pmsn2025/screens/login_screen.dart';
import 'package:pmsn2025/screens/login_screen2.dart';
import 'package:pmsn2025/utils/theme_app.dart';
import 'package:pmsn2025/utils/value_listener.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ValueListenableBuilder(
          valueListenable: ValueListener.idDark,
          builder: (context, value, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: value ? ThemeApp.darkTheme() : ThemeApp.lightTheme(),
              routes: {
            "/home" : (context) => HomeScreen(),
            "/challenge_detail":(context) => ChallengeDetail(),
            "/login_screen2" : (context) => LoginScreen2(),
          
          },
          title: 'Material App',
          home: LoginScreen(),
            );
            
          },
          
        );
      }
    );
  }
}

//siempre que se utiliza un builder va a regresar un widget esto si termina la palabra en builder