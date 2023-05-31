// ignore_for_file: sized_box_for_whitespace, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_function_literals_in_foreach_calls, non_constant_identifier_names

import 'package:banquillosl/Leer%20Datos/Get_Username.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class UserInfoHomePage extends StatefulWidget {
  const UserInfoHomePage({super.key});

  @override
  State<UserInfoHomePage> createState() => _UserInfoHomePageState();
}

class _UserInfoHomePageState extends State<UserInfoHomePage> {
  final db = FirebaseFirestore.instance;

  final user = FirebaseAuth.instance.currentUser;
  List<String> docId = [];

  Future GetId() async {
    await db
        .collection('users')
        .where('Email', isEqualTo: user?.email.toString())
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

  Future<String> obtenerFechaHoraActual() async {
    // Inicializar el formato de fecha y hora para el idioma español
    await initializeDateFormatting('es');

    var ahora = DateTime.now();

    await initializeDateFormatting('es');

    // Crear un objeto DateFormat para formatear la fecha y la hora en español
    var format = DateFormat.yMEd('es').add_jms();

    // Formatear la fecha y la hora actual en español
    var fechaHoraFormateada = format.format(ahora);

    return fechaHoraFormateada;
  }

  Widget Fecha() {
    return FutureBuilder<String>(
      future: obtenerFechaHoraActual(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            ' ${snapshot.data}',
            style: TextStyle(color: Colors.white),
          );
        } else if (snapshot.hasError) {
          return Text(
            'Error al obtener la fecha y hora',
            style: TextStyle(color: Colors.white),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black45,
        ),
        margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 55.0,
              height: 55.0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png?f=webp&w=256'),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        FutureBuilder(
                          future: GetId(),
                          builder: (context, snapshot) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: docId.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: GetUserName(documentId: docId[index]),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 15,
                          color: Colors.amber[900],
                        ),
                        Fecha()
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
