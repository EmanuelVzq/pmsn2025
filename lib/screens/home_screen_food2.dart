import 'package:flutter/material.dart';

class HomeScreenFood2 extends StatefulWidget {
  const HomeScreenFood2({super.key});

  @override
  State<HomeScreenFood2> createState() => _HomeScreenFood2State();
}

class _HomeScreenFood2State extends State<HomeScreenFood2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 230, 230),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
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
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Text(
                    "Menú",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.black),
                  title: const Text(
                    "Inicio",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: const Text(
                    "Perfil",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Order Delicious Meal!',
              style: TextStyle(
                fontFamily: 'Anja',
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              spacing: 5,
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                      hintText: 'Restaurants, Food...',
                      hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.tune, color: Colors.black, size: 30,),
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Explore Categories',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
