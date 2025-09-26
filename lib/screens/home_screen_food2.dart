import 'package:flutter/material.dart';

class HomeScreenFood2 extends StatefulWidget {
  const HomeScreenFood2({super.key});

  @override
  State<HomeScreenFood2> createState() => _HomeScreenFood2State();
}

class _HomeScreenFood2State extends State<HomeScreenFood2> {
  final List<Map<String, dynamic>> categories = [
    {"name": "Burger", "icon": "🍔"},
    {"name": "Hot Dogs", "icon": "🌭"},
    {"name": "Kabab", "icon": "🥙"},
    {"name": "Ice-cream", "icon": "🍦"},
  ];

  final List<Map<String, dynamic>> food_card = [
    {
      "name": "Peperoni Pizza",
      "description": "Delicious pizza of every person",
      "image": "assets/ball.png",
      "calories": "88 Calories",
      "price": "10.00",
    },

    {
      "name": "Peperoni Pizza",
      "description": "Delicious pizza of every person",
      "image": "assets/ball.png",
      "calories": "88 Calories",
      "price": "10.00",
    },

    {
      "name": "Peperoni Pizza",
      "description": "Delicious pizza of every person",
      "image": "assets/ball.png",
      "calories": "88 Calories",
      "price": "10.00",
    },

    {
      "name": "Peperoni Pizza",
      "description": "Delicious pizza of every person",
      "image": "assets/ball.png",
      "calories": "88 Calories",
      "price": "10.00",
    },
  ];

  int selectedIndex = 0;
  int selectedFoodIndex = 0; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        iconTheme: const IconThemeData(color: Colors.black),
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
          const Padding(
            padding: EdgeInsets.all(15.0),
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
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Restaurants, Food...',
                      hintStyle: const TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
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
                  icon: const Icon(Icons.tune, color: Colors.black, size: 30),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
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
          Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(categories.length, (index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 100,
                      height: 120,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.orange : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          if (isSelected)
                            BoxShadow(
                              color: Colors.orange.withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape
                                          .circle, // 👈 lo hace circular
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    categories[index]["icon"],
                                    style: const TextStyle(fontSize: 30),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 60),
                                  child: Center(
                                    child: Text(
                                      categories[index]["name"],
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(food_card.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFoodIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 180,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          20,
                        ), // esquinas redondeadas
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Imagen circular
                          Center(
                            child: ClipOval(
                              child: Image.asset(
                                food_card[index]["image"], 
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Nombre
                          Text(
                            food_card[index]["name"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          // Descripción
                          Text(
                            food_card[index]["description"],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Calorías
                          Row(
                            children: [
                              const Icon(
                                Icons.local_fire_department,
                                color: Colors.orange,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${food_card[index]["calories"]} Calories",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Precio y botón favorito
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${food_card[index]["price"]}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
