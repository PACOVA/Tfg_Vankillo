// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NuevaContrasena extends StatefulWidget {
  const NuevaContrasena({super.key});

  @override
  State<NuevaContrasena> createState() => _NuevaContrasenaState();
}

class _NuevaContrasenaState extends State<NuevaContrasena> {
  final _emailController = TextEditingController();
  bool camposCompletos = false;

  Future<void> passReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      mensajeLogin('Email enviado a ' + _emailController.text);
    } on FirebaseAuthException catch (e) {
      mensajeLogin(e.message.toString());
    }
  }

  void mensajeLogin(String mensaje) {
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

  Widget botonReset() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35.0),
      child: ElevatedButton(
        onPressed: _emailController.text.isNotEmpty ? passReset : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _emailController.text.isNotEmpty
              ? Color.fromRGBO(0, 150, 249, 1)
              : Color.fromRGBO(0, 76, 126, 100),
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 60.0),
        ),
        child: Text(
          "Reiniciar contraseña",
          style: TextStyle(
            color: _emailController.text.isNotEmpty
                ? Color.fromRGBO(255, 255, 255, 1)
                : Color.fromRGBO(161, 161, 161, 100),
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  void comprobarCamposCompletos() {
    setState(() {
      camposCompletos = _emailController.text.isNotEmpty;
    });
  }

  Widget campoEmail(controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          comprobarCamposCompletos();
        },
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
            olvidadoContrasenaText(),
            campoEmail(_emailController),
            botonReset(),
          ],
        ),
      ),
    );
  }
}

Widget olvidadoContrasenaText() {
  return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Introduzca email para enviar el reinicio de tu contraseña ",
            style: TextStyle(
                color: Color.fromRGBO(208, 211, 212, 1), fontSize: 15),
          ),
        ],
      ));
}
