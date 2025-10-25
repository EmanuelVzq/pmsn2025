import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2025/models/cart.dart';

class HomeScreenFood2 extends StatefulWidget {
  const HomeScreenFood2({super.key});

  @override
  State<HomeScreenFood2> createState() => _HomeScreenFood2State();
}

class _HomeScreenFood2State extends State<HomeScreenFood2> {
  final List<String> promoImages = [
    "assets/pepperoni_pizza.jpeg",
    "assets/mexican_burger.jpg",
    "assets/chili_dog.jpg",
  ];

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
      "image": "assets/pepperoni_pizza.jpeg",
      "calories": "88",
      "price": "10.00",
    },
    {
      "name": "Mexican Burger",
      "description": "Mexican style",
      "image": "assets/mexican_burger.jpg",
      "calories": "88",
      "price": "10.00",
    },
    {
      "name": "Hot Dog",
      "description": "Chili dog",
      "image": "assets/chili_dog.jpg",
      "calories": "88",
      "price": "10.00",
    },
    {
      "name": "Ice Cream",
      "description": "Delicious ice cream",
      "image": "assets/ice_cream.jpg",
      "calories": "88",
      "price": "10.00",
    },
  ];

  final List<Map<String, dynamic>> food_card2 = [
    {
      "name": "Noodles",
      "image": "assets/noodles.jpg",
      "price": "20.00",
      "rating": "4.3",
    },
    {
      "name": "Kabab",
      "image": "assets/kebab.jpg",
      "price": "10.00",
      "rating": "4.3",
    },
    {
      "name": "French Fries",
      "image": "assets/french_fries.jpg",
      "price": "8.00",
      "rating": "4.2",
    },
    {
      "name": "Chicken Wings",
      "image": "assets/chicken_wings.jpg",
      "price": "15.00",
      "rating": "4.5",
    },
  ];

  int selectedIndex = 0;

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
            child: StatefulBuilder(
              builder: (context, setStateDrawer) {
                return ListView(
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
                      onTap: () => Navigator.pop(context),
                    ),

                    ListTile(
                      leading: Badge(
                        backgroundColor: Colors.orange,
                        label: Text(
                          '${GlobalCart.carrito.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                      ),
                      title: const Text(
                        "Carrito",
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/cart");
                      },
                    ),

                    ListTile(
                      leading: const Icon(Icons.history, color: Colors.black),
                      title: const Text(
                        "Historial de compras",
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/historial");
                      },
                    ),
                  ],
                );
              },
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 4),
                viewportFraction: 0.9,
              ),
              items: promoImages.map((img) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
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
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            categories[index]["icon"],
                            style: const TextStyle(fontSize: 35),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            categories[index]["name"],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
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
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 180,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
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
                        Text(
                          food_card[index]["name"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          food_card[index]["description"],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              food_card[index]["image"],
                              width: 150,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${food_card[index]["price"]}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                final producto = food_card[index];
                                bool existe = GlobalCart.carrito.any(
                                  (p) => p["name"] == producto["name"],
                                );

                                if (!existe) {
                                  GlobalCart.carrito.add({
                                    "name": producto["name"],
                                    "price":
                                        double.tryParse(producto["price"]) ??
                                        0.0,
                                    "cantidad": 1,
                                    "image": producto["image"],
                                    "calories": producto["calories"],
                                  });

                                  setState(
                                    () {},
                                  ); // 
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "${producto["name"]} añadido al carrito",
                                      ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "${producto["name"]} ya está en el carrito",
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Upcoming food',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(food_card2.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 15),
                    width: 200,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            food_card2[index]["image"],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                food_card2[index]["name"],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    food_card2[index]["rating"],
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "\$${food_card2[index]["price"]}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
