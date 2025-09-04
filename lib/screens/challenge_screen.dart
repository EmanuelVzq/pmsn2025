import 'package:flutter/material.dart';
import 'package:pmsn2025/screens/tarjeta_equipo.dart';

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
              padding: const EdgeInsets.only(top: 20, bottom: 100),
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Contorno negro
                    Text(
                      'GEOMETRY DASH',
                      style: TextStyle(
                        fontFamily: 'oxygene',
                        fontSize: 50,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.black,
                      ),
                    ),
                    // Relleno verde ARGB
                    Text(
                      'GEOMETRY DASH',
                      style: TextStyle(
                        fontFamily: 'oxygene',
                        fontSize: 50,
                        color: const Color.fromARGB(
                          255,
                          102,
                          255,
                          51,
                        ), // Verde estilo Geometry Dash
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TarjetaEquipo(
                  imagePath: 'realmadrid.png',
                  titulo: 'REAL MADRID CF',
                ),
                SizedBox(height: 50),
                TarjetaEquipo(
                  imagePath: 'realmadrid.png',
                  titulo: 'REAL MADRID CF',
                ),
                SizedBox(height: 50),
                TarjetaEquipo(
                  imagePath: 'realmadrid.png',
                  titulo: 'REAL MADRID CF',
                ),
                SizedBox(height: 50),
                TarjetaEquipo(
                  imagePath: 'realmadrid.png',
                  titulo: 'REAL MADRID CF',
                ),
                SizedBox(height: 50),
                TarjetaEquipo(
                  imagePath: 'realmadrid.png',
                  titulo: 'REAL MADRID CF',
                ),
                SizedBox(height: 50),
                TarjetaEquipo(
                  imagePath: 'realmadrid.png',
                  titulo: 'REAL MADRID CF',
                ),
                SizedBox(height: 50),
                TarjetaEquipo(
                  imagePath: 'realmadrid.png',
                  titulo: 'REAL MADRID CF',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
