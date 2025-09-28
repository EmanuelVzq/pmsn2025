import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<Map<String, dynamic>> foodItems = [
    {
      "name": "Mexican Cheese",
      "image": "assets/ball.png",
      "calories": "88",
      "price": "20.00",
    },
    {
      "name": "Beef Burger",
      "image": "assets/ball.png",
      "calories": "96",
      "price": "10.00",
    },
    {
      "name": "Beef Steak",
      "image": "assets/ball.png",
      "calories": "120",
      "price": "15.00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(fontFamily: 'Anja', color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final item = foodItems[index];

          return Slidable(
            key: ValueKey(item["name"]),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              extentRatio: 0.25,
              children: [
                CustomSlidableAction(
                  onPressed: (context) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Presionaste X en ${item["name"]}"),
                      ),
                    );
                  },
                  backgroundColor:
                      Colors.transparent, 
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 28, // 👈 tamaño de la X
                    ),
                  ),
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                  // Imagen circular
                  ClipOval(
                    child: Image.asset(
                      item["image"],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),

                  // Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["name"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.local_fire_department,
                              color: Colors.orange,
                              size: 16,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${item["calories"]} Calories",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Precio
                  Text(
                    "\$${item["price"]}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
