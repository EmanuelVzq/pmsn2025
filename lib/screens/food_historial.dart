import 'package:flutter/material.dart';
import 'package:pmsn2025/database/food_database.dart';

class FoodHistorial extends StatefulWidget {
  const FoodHistorial({super.key});

  @override
  State<FoodHistorial> createState() => _FoodHistorialState();
}

class _FoodHistorialState extends State<FoodHistorial> {
  final db = FoodDatabase();
  List<Map<String, dynamic>> compras = [];

  @override
  void initState() {
    super.initState();
    cargarCompras();
  }

  Future<void> cargarCompras() async {
    final data = await db.selectAllCompras();
    setState(() {
      compras = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        centerTitle: true,
        title: const Text(
          "Historial de Compras",
          style: TextStyle(fontFamily: 'Anja', color: Colors.black),
        ),
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
      ),
      body: compras.isEmpty
          ? const Center(
              child: Text(
                "No hay compras registradas",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: compras.length,
              itemBuilder: (context, index) {
                final compra = compras[index];
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(Icons.receipt_long,
                        color: Colors.orange, size: 30),
                    title: Text(
                      "Compra #${compra['id_compra']}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    subtitle: Text(
                      "Fecha: ${compra['fecha']}\nTotal: \$${compra['total'].toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.black54),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.visibility, color: Colors.black),
                      onPressed: () async {
                        final detalles = await db
                            .selectDetalles(compra['id_compra'] as int);
                        mostrarDetalles(context, detalles);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }

  void mostrarDetalles(BuildContext context, List<DetalleCompra> detalles) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Detalles de la compra"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: detalles.length,
              itemBuilder: (context, index) {
                final d = detalles[index];
                return ListTile(
                  leading: const Icon(Icons.fastfood, color: Colors.orange),
                  title: Text(d.producto ?? "Producto"),
                  subtitle: Text(
                    "Cantidad: ${d.cantidad}  |  Precio: \$${d.precio?.toStringAsFixed(2)}",
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
  }
}
