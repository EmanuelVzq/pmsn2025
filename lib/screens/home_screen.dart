import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:pmsn2025/utils/colors_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SliderDrawer(
      appBar: SliderAppBar(
        config: SliderAppBarConfig(
          title: Text(
            'Navegación',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0),
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
      sliderOpenSize: 250,
      slider: Material(
        color: Colors.blueGrey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          children: [
            const DrawerHeader(
              child: Text("Menú", style: TextStyle(fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Inicio"),
              onTap: () {
                print("Inicio presionado");
              },
            ),
            ListTile(
              leading: Icon(Icons.games),
              title: Text("Challenge"),
              onTap: () {
                print("Challenge presionado");
              },
            ),
          ],
        ),
      ),
      child: Container(
        color: Colors.blue.shade50,
        child: const Center(
          child: Text(
            'Contenido principal',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black, 
              decoration: TextDecoration.none,),
          ),
        ),
      ),
    );
  }
}
