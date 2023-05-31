// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sort_child_properties_last, avoid_print

import 'package:banquillosl/Login/auth_page.dart';
import 'package:banquillosl/pages/HomeUsuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CambiarJugador extends StatefulWidget {
  CambiarJugador(this.qrCodeContent);

  final String? qrCodeContent;

  @override
  State<CambiarJugador> createState() => _CambiarJugadorState();
}

class _CambiarJugadorState extends State<CambiarJugador> {
  final user = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  Future<String?> UpdateUserType(User? user) async {
    try {
      if (user != null) {
        final documentReference = db.collection('users').doc(user.uid);
        await documentReference.update({'tipo': 'jugador'});
        print('Tipo de usuario actualizado a: Jugador');
        return 'jugador';
      }
    } catch (e) {
      print('Error al actualizar el tipo de usuario: $e');
    }
    return null;
  }

  void CreacionJugador() async {
    final user = FirebaseAuth.instance;

    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Lottie.network(
              'https://assets1.lottiefiles.com/packages/lf20_NRU0Ze.json'),
        );
      },
    );

    final Jugador = <String, dynamic>{
      "email": user.currentUser!.email,
      "puntos Doble": 0,
      "rebotes": 0,
      "triples": 0,
      "bloqueos": 0,
      "faltas": 0,
      "minutos jugados": 0
    };

    try {
      db.collection("Jugadores").doc(user.currentUser!.uid).set(Jugador);

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      ErrorLogin(e.code);
    }
  }

  void ErrorLogin(String mensaje) {
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

  void mensajeCambiarJugador() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            '¿Quieres cambiar a jugador?',
            style: TextStyle(color: Colors.white),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  UpdateUserType(user.currentUser);
                  CreacionJugador();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Auth(),
                    ),
                  );
                },
                child: Text(
                  'SI',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[900]),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('NO'))
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeUsuario(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[900]),
          onPressed: mensajeCambiarJugador,
          child: Text('Cambiar a jugador'),
        ),
      ),
    );
  }
}
