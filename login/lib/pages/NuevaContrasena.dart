// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NuevaContrasena extends StatefulWidget {
  const NuevaContrasena({super.key});

  @override
  State<NuevaContrasena> createState() => _NuevaContrasenaState();
}

class _NuevaContrasenaState extends State<NuevaContrasena> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future PassReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      MensajeLogin('Email enviado a ' + _emailController.text);
    } on FirebaseAuthException catch (e) {
      MensajeLogin(e.message.toString());
    }
  }

  void MensajeLogin(String mensaje) {
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

  Widget BotonReset() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35.0),
      child: ElevatedButton(
          onPressed: PassReset,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(0, 76, 126, 100),
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 60.0),
          ),
          child: Text(
            "Reiniciar contraseña",
            style: TextStyle(
                color: Color.fromRGBO(161, 161, 161, 100), fontSize: 20),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OlvidadoContrasenaText(),
            CampoEmail(_emailController),
            BotonReset()
          ],
        ),
      ),
    );
  }
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

Widget OlvidadoContrasenaText() {
  return Padding(
    padding: const EdgeInsets.only(left: 12, bottom: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Introduzca email para enviar el reinicio de tu contraseña ",
          style:
              TextStyle(color: Color.fromRGBO(208, 211, 212, 1), fontSize: 15),
        ),
      ],
    ),
  );
}
