// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, use_build_context_synchronously, avoid_print, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/NuevaContrasena.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final EmailController = TextEditingController();

  final PasswordController = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: EmailController.text, password: PasswordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      EnsenarErrorInicio(e.message.toString());
    }
  }

  void EnsenarErrorInicio(String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            mensaje,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  Widget BotonEntrar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35.0),
      child: ElevatedButton(
          onPressed: signUserIn,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(0, 76, 126, 100),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
          ),
          child: Text(
            "Entrar",
            style: TextStyle(
                color: Color.fromRGBO(161, 161, 161, 100), fontSize: 20),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 210,
              ),
              Titulo(),
              SizedBox(
                height: 100,
              ),
              InicioSecion(),
              CampoEmail(EmailController),
              SizedBox(
                height: 20,
              ),
              CampoContrasena(PasswordController),
              OlvidadoContrasena(context),
              BotonEntrar(),
              CrearCuenta(context, widget.onTap),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Titulo() {
  return Text(
    "Vankillo SL",
    style: TextStyle(fontSize: 45, color: Colors.white),
  );
}

Widget CampoEmail(controller) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
    child: TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(color: Color.fromRGBO(161, 161, 161, 100)),
        fillColor: Color.fromRGBO(37, 37, 37, 100),
        filled: true,
      ),
    ),
  );
}

Widget CampoContrasena(controller) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
    child: TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      obscureText: true,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: "Contraseña",
        hintStyle: TextStyle(color: Color.fromRGBO(161, 161, 161, 100)),
        fillColor: Color.fromRGBO(37, 37, 37, 100),
        filled: true,
      ),
    ),
  );
}

Widget OlvidadoContrasena(context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NuevaContrasena(),
                ),
              ),
            },
            child: Text(
              "¿Has olvidado la contraseña?",
              style: TextStyle(
                color: Color.fromRGBO(33, 140, 212, 100),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 30,
        )
      ],
    ),
  );
}

Widget CrearCuenta(context, onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "¿No Tienes Cuenta?",
        style: TextStyle(color: Colors.white70),
      ),
      SizedBox(width: 5),
      GestureDetector(
        onTap: onTap,
        child: Text(
          "Crear Cuenta",
          style: TextStyle(
            color: Color.fromRGBO(33, 140, 212, 100),
          ),
        ),
      ),
    ],
  );
}

Widget InicioSecion() {
  return Padding(
    padding: const EdgeInsets.only(left: 40, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Inicio de Secion",
          style:
              TextStyle(color: Color.fromRGBO(208, 211, 212, 1), fontSize: 15),
        ),
      ],
    ),
  );
}
