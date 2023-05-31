// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, sized_box_for_whitespace, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GetPartidos extends StatelessWidget {
  const GetPartidos({super.key, required this.documentId});
  final String documentId;
  @override
  Widget build(BuildContext context) {
    CollectionReference partidos =
        FirebaseFirestore.instance.collection('partidos');

    return FutureBuilder<DocumentSnapshot>(
        future: partidos.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        child: Text(
                          data['local'],
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: Colors.amber[900], fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30),
                        child: Center(
                          child: Container(
                            width: 60,
                            height: 80,
                            child: Lottie.network(
                                'https://assets5.lottiefiles.com/packages/lf20_cINZhW4UWL.json'),
                          ),
                        ),
                      ),
                      Text(
                        data['visitante'],
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Text(
            'Cargando ...',
            style: TextStyle(fontSize: 26, color: Colors.white),
          );
        }));
  }
}
