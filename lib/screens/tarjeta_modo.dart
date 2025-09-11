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
        Transform.translate(
          offset: const Offset(-30, 30),
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.1)
              ..rotateY(0.4 * (pi / 180)),
            child: Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        ),

        Transform.translate(
          offset: const Offset(-57, 27),
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.1)
              ..rotateY(1 * (pi / 180)),
            child: Container(
              height: 158,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Hero(
            tag: mode, 
            child: Image.asset(imagePath, height: 150)
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 160, top: 70),
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

        Padding(
          padding: const EdgeInsets.only(left: 270, top: 150),
          child: ElevatedButton.icon(
            onPressed: () {
              /*Navigator.pushNamed(
                context,
                '/challenge_detail',
                arguments: mode, 
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
              color: Colors.black, 
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), 
              ),
              elevation: 5, 
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}
