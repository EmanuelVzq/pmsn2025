import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/cart.dart'; // Asegúrate que apunta al archivo donde tienes GlobalCart

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> foodItems = GlobalCart.carrito;

    // 🔢 Calcular subtotal y total dinámico
    double subtotal = foodItems.fold(
      0.0,
      (sum, item) =>
          sum + ((item["price"] ?? 0.0) * ((item["cantidad"] ?? 1).toDouble())),
    );
    double shipping = 10.00;
    double total = subtotal + shipping;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(fontFamily: 'Anja', color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),

      // 🧾 Lista de productos del carrito
      body: foodItems.isEmpty
          ? const Center(
              child: Text(
                "Tu carrito está vacío",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            )
          : ListView.builder(
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
                      SlidableAction(
                        onPressed: (context) {
                          setState(() {
                            GlobalCart.carrito.remove(item);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "${item["name"]} eliminado del carrito."),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Eliminar',
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
                        // 🖼️ Imagen del producto
                        ClipOval(
                          child: Image.asset(
                            item["image"] ?? 'assets/placeholder.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/placeholder.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 15),

                        // 📄 Información del producto
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["name"] ?? "Producto sin nombre",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
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
                                    "${item["calories"] ?? "0"} Calories",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // 🔢 Contador de cantidad
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if ((item["cantidad"] ?? 1) > 1) {
                                          item["cantidad"] =
                                              (item["cantidad"] ?? 1) - 1;
                                        }
                                      });
                                    },
                                    child: const Icon(
                                      Icons.arrow_left,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    (item["cantidad"] ?? 1)
                                        .toString()
                                        .padLeft(2, "0"),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        item["cantidad"] =
                                            (item["cantidad"] ?? 0) + 1;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.arrow_right,
                                      color: Colors.amber,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // ❤️ y precio
                        Column(
                          children: [
                            Container(
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
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Text(
                                  "\$",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                                Text(
                                  ((item["price"] ?? 0.0) *
                                          ((item["cantidad"] ?? 1).toDouble()))
                                      .toStringAsFixed(2),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

      // 🧮 Bottom bar con totales
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Shipping cost",
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
                Text("\$${shipping.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Subtotal",
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
                Text("\$${subtotal.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
            const Divider(color: Colors.white24, thickness: 1, height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Text("\$${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white24),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white70),
                  SizedBox(width: 10),
                  Text("Add promo code",
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/checkout");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Checkout",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Anja',
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
