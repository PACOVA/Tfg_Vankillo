// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class EstadisticasJugador extends StatelessWidget {
  EstadisticasJugador({super.key, required this.documentId});

  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Jugadores');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  CircularPercentIndicator(
                    radius: 23,
                    lineWidth: 5,
                    percent: data['puntos Doble'] != null &&
                            data['puntos Doble'] != 0
                        ? data['puntos Doble'] / 100.0
                        : 0,
                    backgroundColor: Colors.grey,
                    backgroundWidth: 3,
                    progressColor: Colors.amber[900],
                    center: Text(
                      '${data['puntos Doble'] != null ? data['puntos Doble'] : 0}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    'Dobles',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    '${data['puntos Doble']}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  CircularPercentIndicator(
                    radius: 23,
                    lineWidth: 5,
                    percent: data['triples'] != null && data['triples'] != 0
                        ? data['triples'] / 100.0
                        : 0,
                    backgroundColor: Colors.grey,
                    backgroundWidth: 3,
                    progressColor: Colors.amber[900],
                    center: Text(
                      '${data['triples'] != null ? data['triples'] : 0}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    'Triples',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    '${data['triples']}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  CircularPercentIndicator(
                    radius: 23,
                    lineWidth: 5,
                    percent: data['bloqueos'] != null && data['bloqueos'] != 0
                        ? data['bloqueos'] / 100.0
                        : 0,
                    backgroundColor: Colors.grey,
                    backgroundWidth: 3,
                    progressColor: Colors.amber[900],
                    center: Text(
                      '${data['bloqueos'] != null ? data['bloqueos'] : 0}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    'Bloqueo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    '${data['bloqueos']}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  CircularPercentIndicator(
                    radius: 23,
                    lineWidth: 5,
                    percent: data['faltas'] != null && data['faltas'] != 0
                        ? data['faltas'] / 100.0
                        : 0,
                    backgroundColor: Colors.grey,
                    backgroundWidth: 3,
                    progressColor: Colors.amber[900],
                    center: Text(
                      '${data['faltas'] != null ? data['faltas'] : 0}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    'Faltas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    '${data['faltas']}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  CircularPercentIndicator(
                    radius: 23,
                    lineWidth: 5,
                    percent: data['rebotes'] != null && data['rebotes'] != 0
                        ? data['rebotes'] / 100.0
                        : 0,
                    backgroundColor: Colors.grey,
                    backgroundWidth: 3,
                    progressColor: Colors.amber[900],
                    center: Text(
                      '${data['rebotes'] != null ? data['rebotes'] : 0}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    'Rebotes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    '${data['rebotes']}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  CircularPercentIndicator(
                    radius: 23,
                    lineWidth: 5,
                    percent: (data['minutos jugados'] != null &&
                            data['minutos jugados'] != 0)
                        ? (data['minutos jugados'] / 60.0).clamp(0.0, 1.0)
                        : 0,
                    backgroundColor: Colors.grey,
                    backgroundWidth: 3,
                    progressColor: Colors.amber[900],
                    center: Text(
                      '${data['minutos jugados'] != null ? data['minutos jugados'] : 0}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    'min. jugados',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    '${data['minutos jugados']}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          );
        }
        return Text(
          'Cargando ...',
          style: TextStyle(fontSize: 26, color: Colors.white),
        );
      },
    );
  }
}
