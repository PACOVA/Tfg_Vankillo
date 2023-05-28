// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class CambiarJugador extends StatefulWidget {
  const CambiarJugador({super.key});

  @override
  State<CambiarJugador> createState() => _CambiarJugadorState();
}

class _CambiarJugadorState extends State<CambiarJugador> {
    void MensajeCambiarJugador() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: 
           Text('Quieres Cambiar a Jugador' ,
            style: TextStyle(color: Colors.white),
           )
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MensajeCambiarJugador();
    )
  }
  }
