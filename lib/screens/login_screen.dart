import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController conUser = TextEditingController();
  TextEditingController conPwd = TextEditingController();
  bool isValidating = false;

  @override
  Widget build(BuildContext context) {
    final txtUser = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: conUser,
      decoration: InputDecoration(hintText: 'Correo Electronico'),
    );

    final txtPwd = TextField(
      obscureText: true,
      controller: conPwd,
      decoration: InputDecoration(hintText: 'Contraseña'),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/fondo_login.jpg'),
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              bottom: 20,
              right: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login_screen2');
                },
                icon: Icon(Icons.person, size: 50),
              ),
            ),
            Positioned(
              top: 170,
              child: Text(
                'Night',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'EA',
                  fontSize: 40,
                ),
              ),
            ),
            Positioned(
              bottom: 240,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .25,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    txtUser,
                    txtPwd,
                    IconButton(
                      onPressed: () {
                        isValidating = true;
                        setState(() {});
                        Future.delayed(Duration(milliseconds: 2000)).then(
                          (value) => Navigator.pushNamed(context, "/home"),
                        );
                      },
                      icon: Icon(Icons.login, size: 40),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.5,
              child: isValidating
                  ? Lottie.asset('assets/loading2.json', height: 200)
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
//fit sirve para rellenar los espacios vacios con la imagen
//un statefull se usa cuando la interfaz se necesita renderizar de nueva cuenta y tambien cuando se realizan peticiones
//un stateless es cuando se usa una pantalla que no cambia