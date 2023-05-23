// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, non_constant_identifier_names

import 'package:banquillosl/Leer%20Datos/Get_partidos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListaPartidos extends StatefulWidget {
  const ListaPartidos({super.key});

  @override
  State<ListaPartidos> createState() => _ListaPartidosState();
}

class _ListaPartidosState extends State<ListaPartidos> {
  final db = FirebaseFirestore.instance;

  List<String> docId = [];

  Future GetId() async {
    await db.collection('partidos').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              docId.add(document.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetId(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: docId.length,
          itemBuilder: (context, index) {
            return GetPartidos(documentId: docId[index]);
          },
        );
      },
    );
  }
}
