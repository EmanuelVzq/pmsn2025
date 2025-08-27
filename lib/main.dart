import 'package:flutter/material.dart';
import 'package:pmsn2025/utils/colors_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   int contador=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PMSN2025'),
        ),
        body: Center(
          child: Text('Contador $contador', style: TextStyle(fontSize: 25, fontFamily: 'EA', color: ColorsApp.txtColor),),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ads_click),
          onPressed: (){
            contador++;
            print(contador);
            setState(() {
              
            });
          }
        ),
      ),
    );
  }

  miEvento(){}
}

//variables estaticas definicion
//metodos anonimos (){}
// () => mievento ----> sirve para ejecutar solo una instruccion 
//interpolacion de cadenas 1 elemento $variable
//interpolacion de cadenas acceso a variable con un dato ${clase.variable}
