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
    String asset2='';

    switch (mode) {
      case GdMode.ship:
        title = 'SHIP';
        description =
            'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\nSe basa en precisión de vuelo y cambios de gravedad en espacios estrechos.';
        backgroundEffect = Transform.translate(
          offset: const Offset(-30, 30),
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.2)
              ..rotateY(0.5 * (pi / 180)),
            child: Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        );
        asset = 'assets/ship.png';
        asset2 = "assets/gd_ship.PNG";
        gradient = const LinearGradient(
          colors: [
            Color.fromARGB(255, 252, 96, 231),
            Color.fromARGB(255, 184, 64, 64),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        break;

      case GdMode.ball:
        title = 'BALL';
        description =
            'El jugador controla una modo de juego en donde al dar clic se cambia de gravedad.\n Se basa en precisión para dar el clic en el momento correcto.';
        backgroundEffect = Transform.translate(
          offset: const Offset(-30, 30),
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.2)
              ..rotateY(0.5 * (pi / 180)),
            child: Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        );
        asset = 'assets/ball.png';
        asset2 = "assets/gd_ball.PNG";
        gradient = const LinearGradient(
          colors: [
            Color.fromARGB(255, 231, 47, 47),
            Color.fromARGB(255, 194, 127, 40),
          ], // rojo → rosa
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        break;
      case GdMode.ufo:
        title = 'UFO';
        description =
          'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\n Se basa en precisión de vuelo y cambios de gravedad en espacios estrechos.';
        backgroundEffect = Transform.translate(
          offset: const Offset(-30, 30),
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.2)
              ..rotateY(0.5 * (pi / 180)),
            child: Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        );
        asset = 'assets/ufo.png';
        asset2 = "assets/gd_ufo.PNG";
        gradient = const LinearGradient(
          colors: [
            Color.fromARGB(255, 236, 129, 7),
            Color.fromARGB(255, 207, 186, 65),
          ], // verde → lima
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        break;
      case GdMode.wave:
        title = 'WAVE';
        description =
          'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\n Se basa en precisión de vuelo y cambios de gravedad en espacios estrechos.';
        backgroundEffect = Transform.translate(
          offset: const Offset(-30, 30),
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.2)
              ..rotateY(0.5 * (pi / 180)),
            child: Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        );
        asset = 'assets/wave.png';
        asset2 = "assets/gd_wave.PNG";
        gradient = const LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 199, 189),
            Color.fromARGB(255, 45, 2, 133),
          ], // morado → violeta
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        break;
      case GdMode.robot:
        title = 'ROBOT';
        description =
          'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\n Se basa en precisión de vuelo y cambios de gravedad en espacios estrechos.';
        backgroundEffect = Transform.translate(
          offset: const Offset(-30, 30),
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.2)
              ..rotateY(0.5 * (pi / 180)),
            child: Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        );
        asset = 'assets/robot.png';
        asset2 = "assets/gd_robot.PNG";
        gradient = const LinearGradient(
          colors: [
            Color.fromARGB(255, 136, 141, 143),
            Color.fromARGB(255, 39, 40, 41),
          ], // naranja → azul oscuro
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        break;
      case GdMode.spider:
        title = 'SPIDER';
        description =
          'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\n Se basa en precisión de vuelo y cambios de gravedad en espacios estrechos.';
        backgroundEffect = Transform.translate(
          offset: const Offset(-30, 30),
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.2)
              ..rotateY(0.5 * (pi / 180)),
            child: Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        );
        asset = 'assets/spider.png';
        asset2 = "assets/gd_spider.PNG";
        gradient = const LinearGradient(
          colors: [
            Color.fromARGB(255, 173, 30, 161),
            Color.fromARGB(255, 173, 30, 61),
          ], // azul grisáceo
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        break;
      case GdMode.swing:
        title = 'SWING COPTER';
        description =
          'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\n Se basa en precisión de vuelo y cambios de gravedad en espacios estrechos.';
        backgroundEffect = Transform.translate(
          offset: const Offset(-30, 30),
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.2)
              ..rotateY(0.5 * (pi / 180)),
            child: Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        );
        asset = 'assets/swingcopter.png';
        asset2 = "assets/gd_swing.PNG";
        gradient = const LinearGradient(
          colors: [
            Color.fromARGB(255, 155, 153, 76),
            Color.fromARGB(255, 162, 252, 79),
          ], // celeste → azul
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
        break;
      default:
        title = 'MODE';
        description = Text(
          'El jugador controla una nave que sube o baja al mantener o soltar la pantalla.\n Se basa en precisión de vuelo y cambios de gravedad en espacios estrechos.',
        ).toString();
        asset = 'ship.png';
        gradient = const LinearGradient(
          colors: [Colors.blue, Colors.indigo],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: gradient, 
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
                          child: Image.asset(asset, height: 200)
                        )
                      
                    ),
                  ],
                ),
        
                const SizedBox(height: 70),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(250, 250, 250, 0.298),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0), 
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (asset2.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 36),
                    child: Image.asset(asset2, height: 200, fit: BoxFit.contain),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
