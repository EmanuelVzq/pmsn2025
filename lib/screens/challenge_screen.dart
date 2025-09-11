import 'package:flutter/material.dart';
import 'package:pmsn2025/screens/tarjeta_modo.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 87, 126, 255),
                  const Color.fromARGB(255, 13, 36, 87),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.only(top: 20, bottom: 170),
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'GEOMETRY \n DASH',
                      style: TextStyle(
                        fontFamily: 'oxygene',
                        fontSize: 50,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.black,
                      ),
                    ),
                    Text(
                      'GEOMETRY \n DASH',
                      style: TextStyle(
                        fontFamily: 'oxygene',
                        fontSize: 50,
                        color: const Color.fromARGB(
                          255,
                          102,
                          255,
                          51,
                        ), 
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TarjetaModo(
                  imagePath: 'assets/ship.png',
                  titulo: 'SHIP',
                  mode: GdMode.ship,
                ),
                SizedBox(height: 50),
                TarjetaModo(
                  imagePath: 'assets/ball.png',
                  titulo: 'BALL',
                  mode: GdMode.ball,
                ),
                SizedBox(height: 50),
                TarjetaModo(
                  imagePath: 'assets/ufo.png',
                  titulo: 'UFO',
                  mode: GdMode.ufo,
                ),
                SizedBox(height: 50),
                TarjetaModo(
                  imagePath: 'assets/wave.png',
                  titulo: 'WAVE',
                  mode: GdMode.wave,
                ),
                SizedBox(height: 50),
                TarjetaModo(
                  imagePath: 'assets/robot.png',
                  titulo: 'ROBOT',
                  mode: GdMode.robot,
                ),
                SizedBox(height: 50),
                TarjetaModo(
                  imagePath: 'assets/spider.png',
                  titulo: 'SPIDER',
                  mode: GdMode.spider,
                ),
                SizedBox(height: 50),
                TarjetaModo(
                  imagePath: 'assets/swingcopter.png',
                  titulo: 'SWING COPTER',
                  mode: GdMode.swing,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
