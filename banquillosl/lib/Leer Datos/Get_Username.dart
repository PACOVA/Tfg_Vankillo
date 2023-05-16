// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  GetUserName({super.key, required this.documentId});

  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Row(
              children: [
                Text(
                  'Hola ',
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
                Text(
                  data['Usuario'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.amber[900]),
                )
              ],
            );
          }
          return Text('Loading ...');
        }));
  }
}
