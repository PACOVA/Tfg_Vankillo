//<===||::r::u::b::e::n::>
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_function_literals_in_foreach_calls

import 'package:banquillosl/perfilJugador/mi_usuario_jugador/perfil_lista_chart_cirdular.dart';
import 'package:banquillosl/perfilJugador/mi_usuario_jugador/table_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PerfilUsuarioView extends StatefulWidget {
  const PerfilUsuarioView({super.key});

  @override
  State<PerfilUsuarioView> createState() => _PerfilUsuarioViewState();
}

class _PerfilUsuarioViewState extends State<PerfilUsuarioView> {
  final db = FirebaseFirestore.instance;

  final user = FirebaseAuth.instance.currentUser;
  List<String> docId = [];

  Future<String?> GetId() async {
    QuerySnapshot snapshot = await db
        .collection('Jugadores')
        .where('email', isEqualTo: user?.email.toString())
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs[0].reference.id;
    }

    return null;
  }

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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: FutureBuilder<String?>(
                          future: GetId(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                return EstadisticasJugador(
                                    documentId: snapshot.data!);
                              } else {
                                // No se encontró el documento con el ID deseado
                                return Text(
                                  'No se encontró el documento',
                                  style: TextStyle(color: Colors.white),
                                );
                              }
                            }
                            return Text('Cargando ...');
                          },
                        ),
                      ),
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
