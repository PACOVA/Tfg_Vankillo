// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, non_constant_identifier_names, avoid_print, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:login/Leer%20Datos/Get_Username.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = FirebaseFirestore.instance;

  final user = FirebaseAuth.instance.currentUser!;

  void CerrarSecion() async {
    FirebaseAuth.instance.signOut();
  }

  List<String> docId = [];

  Future GetId() async {
    await db
        .collection('users')
        .where('Email', isEqualTo: user.email.toString())
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              docId.clear();
              docId.add(document.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: CerrarSecion,
            child: Text("Salir"),
          ),
          Container(
            width: 200,
            height: 200,
            child: FutureBuilder(
              future: GetId(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: docId.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: GetUserName(documentId: docId[index]),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

String nombreUsuario = '';
