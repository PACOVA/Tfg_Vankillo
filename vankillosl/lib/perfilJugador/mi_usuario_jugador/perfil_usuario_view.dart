//<===||::r::u::b::e::n::>
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:vankillosl/perfilJugador/mi_usuario_jugador/perfil_lista_chart_cirdular.dart';
import 'package:vankillosl/perfilJugador/mi_usuario_jugador/table_chart.dart';

class PerfilUsuarioView extends StatelessWidget {
  const PerfilUsuarioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.black45,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mis Estadisticas',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber[900],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          child: Lottie.network(
                              'https://assets3.lottiefiles.com/packages/lf20_SONQkv66pb.json'),
                        ),
                      ],
                    ),
                    TablaAnaliticsMiUsuario(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Datos/Partidos Jugados',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber[900],
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          child: Lottie.network(
                              'https://assets1.lottiefiles.com/packages/lf20_uC57Bc.json'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleProgressChart(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
