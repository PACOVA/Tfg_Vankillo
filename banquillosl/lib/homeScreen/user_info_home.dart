// ignore_for_file: sized_box_for_whitespace, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_function_literals_in_foreach_calls, non_constant_identifier_names

import 'package:banquillosl/Leer%20Datos/Get_Username.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//<===||::r::u::b::e::n::>
class UserInfoHomePage extends StatefulWidget {
  const UserInfoHomePage({super.key});

  @override
  State<UserInfoHomePage> createState() => _UserInfoHomePageState();
}

class _UserInfoHomePageState extends State<UserInfoHomePage> {
  final db = FirebaseFirestore.instance;

  final user = FirebaseAuth.instance.currentUser!;
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
                              physics: NeverScrollableScrollPhysics(),
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
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 15,
                        color: Colors.amber[900],
                      ),
                      Text(
                        DateFormat.yMEd().add_jms().format(DateTime.now()),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
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
