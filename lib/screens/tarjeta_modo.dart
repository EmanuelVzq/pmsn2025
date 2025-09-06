import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pmsn2025/screens/challenge_detail.dart';

enum GdMode { ship, ball, ufo, wave, robot, spider, swing }

class TarjetaModo extends StatelessWidget {
  final String imagePath;
  final String titulo;
  final GdMode mode;

  const TarjetaModo({
    super.key,
    required this.imagePath,
    required this.titulo,
    required this.mode,
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
          padding: const EdgeInsets.all(20.0),
          child: Hero(
            tag: mode, 
            child: Image.asset(imagePath, height: 200)
          ),
        ),

        // Texto
        Padding(
          padding: const EdgeInsets.only(left: 230, top: 70),
          child: Stack(
            children: [
              // Contorno (stroke)
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'grobold',
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 4
                    ..color = Colors.black, // color del contorno
                ),
              ),
              // Relleno
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'grobold',
                  color: Colors.white, // color del texto
                ),
              ),
            ],
          ),
        ),

        // button
        Padding(
          padding: const EdgeInsets.only(left: 370, top: 150),
          child: ElevatedButton.icon(
            onPressed: () {
              /*Navigator.pushNamed(
                context,
                '/challenge_detail',
                arguments: mode, // 👈 pasas el modo
              );*/
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ChallengeDetail(),
                  settings: RouteSettings(arguments: mode),
                ),
              );
            },
            label: Icon(
              Icons.arrow_forward,
              color: Colors.black, // color del icono
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // color de fondo
              foregroundColor: Colors.black, // color al presionar
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // bordes redondeados
              ),
              elevation: 5, // sombra
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}
