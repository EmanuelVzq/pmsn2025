import 'package:flutter/material.dart';
import 'package:pmsn2025/database/food_database.dart';
import 'package:pmsn2025/models/cart.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final List<Map<String, dynamic>> location = [
    {
      "name": "My House",
      "street": "Court Street, Alabama",
      "aditional": "ZIP (65-68-36)",
    },
    {
      "name": "My Office",
      "street": "Court Street, Alabama",
      "aditional": "ZIP (65-68-36)",
    },
  ];

  final List<Map<String, dynamic>> pay = [
    {
      "image": "assets/paypal.png",
      "name": "Paypal",
      "number": "564* **** **** ***0 89 ",
    },
    {
      "image": "assets/credit_card.png",
      "name": "Credit Card",
      "number": "564* **** **** ***0 89 ",
    },
    {
      "image": "assets/debit_card.png",
      "name": "Debit Card",
      "number": "564* **** **** ***0 89 ",
    },
  ];

  int selectedLocation = 0;
  int selectedPay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Checkout',
          style: TextStyle(fontFamily: 'Anja', color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(5, 0, 10, 5),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
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
              onPressed: () {
                print("Más opciones presionado");
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Lista de ubicaciones
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: location.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  constraints: const BoxConstraints(minHeight: 120),
                  child: Row(
                    children: [
                      Radio<int>(
                        value: index,
                        groupValue: selectedLocation,
                        activeColor: Colors.orange,
                        onChanged: (value) {
                          setState(() {
                            selectedLocation = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              location[index]["name"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              location[index]["street"],
                              style: const TextStyle(
                                color: Color.fromARGB(255, 172, 172, 172),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              location[index]["aditional"],
                              style: const TextStyle(
                                color: Color.fromARGB(255, 172, 172, 172),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 🔹 Botón de edición con fondo gris redondo
                      Container(
                        child: IconButton(
                          icon: const Icon(
                            Icons.edit_document,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            print("Editar ${location[index]["name"]}");
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment Method",
                    style: const TextStyle(
                      fontFamily: 'Anja',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz, color: Colors.black),
                  ),
                ],
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pay.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  constraints: BoxConstraints(minHeight: 120),
                  child: Row(
                    children: [
                      Image.asset(pay[index]["image"], width: 40, height: 40),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pay[index]["name"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              pay[index]["number"],
                              style: TextStyle(
                                color: Color.fromARGB(255, 172, 172, 172),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Radio<int>(
                        value: index,
                        groupValue: selectedPay, // o selectedPay según la lista
                        fillColor: WidgetStateProperty.resolveWith<Color>((
                          states,
                        ) {
                          if (states.contains(WidgetState.selected)) {
                            return Colors.orange; // Activo → círculo naranja
                          }
                          return Colors.grey; // Inactivo → círculo gris
                        }),
                        onChanged: (value) {
                          setState(() {
                            selectedPay = value!; // o selectedPay
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
          onPressed: () async {
            if (GlobalCart.carrito.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("El carrito está vacío")),
              );
              return;
            }

            final db = FoodDatabase();

            // ✅ Calcular subtotal y total con seguridad contra nulls
            double subtotal = GlobalCart.carrito.fold(
              0.0,
              (sum, e) => sum + ((e["price"] ?? 0.0) * (e["cantidad"] ?? 1)),
            );

            double shipping = 10.00;
            double total = subtotal + shipping;

            // ✅ Insertar compra
            int idCompra = await db.insertCompra({
              "fecha": DateTime.now().toIso8601String(),
              "total": total,
            }, GlobalCart.carrito);

            // ✅ Vaciar carrito
            GlobalCart.carrito.clear();

            // ✅ Consultar detalles insertados
            final detalles = await db.selectDetalles(idCompra);

            // ✅ Mostrar alerta de confirmación
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Compra realizada exitosamente"),
                  content: SizedBox(
                    width: double.maxFinite,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: detalles.length,
                      itemBuilder: (context, index) {
                        final d = detalles[index];
                        return ListTile(
                          leading: const Icon(
                            Icons.fastfood,
                            color: Colors.orange,
                          ),
                          title: Text(d.producto ?? "Producto"),
                          subtitle: Text(
                            "Cant: ${d.cantidad}  |  Precio: \$${d.precio?.toStringAsFixed(2) ?? '0.00'}",
                          ),
                        );
                      },
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cerrar"),
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text(
            "Pay",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Anja',
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
