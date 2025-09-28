import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PMSN2025'),
      ),
      drawer: SafeArea(
        top: true,
        bottom: false,
        child: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Color.fromARGB(255, 10, 118, 126)),
                  child: Text(
                    "Menú",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.games, color: Colors.black),
                  title: const Text(
                    "Challenge Screen",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/challenge_screen');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.food_bank, color: Colors.black),
                  title: const Text(
                    "Food Screen",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/home_screen_food');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.movie, color: Colors.black),
                  title: const Text(
                    "Movies Screen",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/listdb');
                  },
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
