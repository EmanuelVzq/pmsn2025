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

    switch (mode) {
      case GdMode.ship:
        title = 'SHIP';
        description = 'Controles, física, consejos de vuelo…';
        asset = 'img_gd/ship.png';
        break;
      case GdMode.ball:
        title = 'BALL';
        description = 'Cómo alternar gravedad, timings y prácticas…';
        asset = 'img_gd/ball.png';
        break;
      case GdMode.ufo:
        title = 'UFO';
        description = 'Taps rítmicos, alturas y control fino…';
        asset = 'img_gd/ufo.png';
        break;
      case GdMode.wave:
        title = 'WAVE';
        description = 'Taps rítmicos, alturas y control fino…';
        asset = 'img_gd/wave.png';
      case GdMode.robot:
        title = 'ROBOT';
        description = 'Taps rítmicos, alturas y control fino…';
        asset = 'img_gd/robot.png';
      case GdMode.spider:
        title = 'SPIDER';
        description = 'Taps rítmicos, alturas y control fino…';
        asset = 'img_gd/spider.png';
      case GdMode.swing:
        title = 'SWING COPTER';
        description = 'Taps rítmicos, alturas y control fino…';
        asset = 'img_gd/swingcopter.png';
        break;
      // añade los demás
      default:
        title = 'MODE';
        description = 'Detalles del modo.';
        asset = 'img_gd/ship.png';
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Hero(
              tag: mode,
              child: Center(child: Image.asset(asset, height: 200))
            ),
            const SizedBox(height: 16),
            Text(description, style: const TextStyle(fontSize: 16)),
            // aquí pones listas, tips, tablas, etc. según el modo
          ],
        ),
      ),
    );
  }
}
