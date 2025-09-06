import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pmsn2025/screens/tarjeta_modo.dart';

class ChallengeDetail extends StatelessWidget {
  const ChallengeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final mode = ModalRoute.of(context)!.settings.arguments as GdMode;

    String title;
    String description;
    String asset;
    LinearGradient gradient; 
    Widget backgroundEffect = const SizedBox();

    switch (mode) {
      case GdMode.ship:
  title = 'SHIP';
  description = 'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\nSe basa en precisión de vuelo y cambios de gravedad en espacios estrechos.';
  backgroundEffect = Transform.translate(
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
  );
  asset = 'img_gd/ship.png';
  gradient = const LinearGradient(
    colors: [Color.fromARGB(255, 252, 96, 231), Color.fromARGB(255, 184, 64, 64)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  break;

      case GdMode.ball:
        title = 'BALL';
        description = 'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\n Se basa en precisión de vuelo y cambios de gravedad en espacios estrechos.';
        asset = 'img_gd/ball.png';
        gradient = const LinearGradient(
          colors: [Color.fromARGB(255, 231, 47, 47), Color.fromARGB(255, 194, 127, 40)], // rojo → rosa
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        break;
      case GdMode.ufo:
        title = 'UFO';
        description = Text(
          'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\n Se basa en precisión de vuelo y cambios de gravedad en espacios estrechos.',
        ).toString();
        asset = 'img_gd/ufo.png';
        gradient = const LinearGradient(
          colors: [Color.fromARGB(255, 236, 129, 7), Color.fromARGB(255, 207, 186, 65)], // verde → lima
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        break;
      case GdMode.wave:
        title = 'WAVE';
        description = Text(
          'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\n Se basa en precisión de vuelo y cambios de gravedad en espacios estrechos.',
        ).toString();
        asset = 'img_gd/wave.png';
        gradient = const LinearGradient(
          colors: [Color.fromARGB(255, 0, 199, 189), Color.fromARGB(255, 45, 2, 133)], // morado → violeta
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        break;
      case GdMode.robot:
        title = 'ROBOT';
        description = Text(
          'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\n Se basa en precisión de vuelo y cambios de gravedad en espacios estrechos.',
        ).toString();
        asset = 'img_gd/robot.png';
        gradient = const LinearGradient(
          colors: [Color.fromARGB(255, 136, 141, 143), Color.fromARGB(255, 39, 40, 41)], // naranja → azul oscuro
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        break;
      case GdMode.spider:
        title = 'SPIDER';
        description = Text(
          'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\n Se basa en precisión de vuelo y cambios de gravedad en espacios estrechos.',
        ).toString();
        asset = 'img_gd/spider.png';
        gradient = const LinearGradient(
          colors: [Color.fromARGB(255, 173, 30, 161), Color.fromARGB(255, 173, 30, 61)], // azul grisáceo
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        break;
      case GdMode.swing:
        title = 'SWING COPTER';
        description = Text(
          'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\n Se basa en precisión de vuelo y cambios de gravedad en espacios estrechos.',
        ).toString();
        asset = 'img_gd/swingcopter.png';
        gradient = const LinearGradient(
          colors: [Color.fromARGB(255, 248, 244, 6), Color.fromARGB(255, 162, 252, 79)], // celeste → azul
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        break;
      default:
        title = 'MODE';
        description = Text(
          'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\n Se basa en precisión de vuelo y cambios de gravedad en espacios estrechos.',
        ).toString();
        asset = 'img_gd/ship.png';
        gradient = const LinearGradient(
          colors: [Colors.blue, Colors.indigo],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: gradient, // 👈 degradado dinámico
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Stack(
                children: [
                  backgroundEffect,
              Hero(
                tag: mode,
                child: Center(
                  child: Image.asset(asset, height: 240),
                ),
              ),
                ],
              ),
              
              const SizedBox(height: 16),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white, // contraste con fondo
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
