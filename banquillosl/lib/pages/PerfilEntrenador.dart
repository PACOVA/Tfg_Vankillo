// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class PerfilEntrenador extends StatefulWidget {
  const PerfilEntrenador({super.key});

  @override
  State<PerfilEntrenador> createState() => _PerfilEntrenadorState();
}

class _PerfilEntrenadorState extends State<PerfilEntrenador> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Entrnador")],
    );
  }
}
