import 'dart:math';
import 'package:flutter/material.dart';

class TarjetaEquipo extends StatelessWidget {
  final String imagePath;
  final String titulo;

  const TarjetaEquipo({
    super.key,
    required this.imagePath,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Capa 1
        Transform.translate(
          offset: const Offset(-30, 30),
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.1)
              ..rotateY(0.5 * (pi / 180)),
            child: Container(
              height: 180,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        ),

        // Capa 2
        Transform.translate(
          offset: const Offset(-57, 27),
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.1)
              ..rotateY(0.8 * (pi / 180)),
            child: Container(
              height: 188,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        ),

        // Imagen
        Padding(
          padding: const EdgeInsets.all(45.0),
          child: Image.asset(imagePath, height: 150),
        ),

        // Texto
        Padding(
          padding: const EdgeInsets.only(left: 200, top: 70),
          child: Text(
            titulo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'EA', // Puedes cambiar o quitar si no usas EA Sports
            ),
          ),
        ),
      ],
    );
  }
}
