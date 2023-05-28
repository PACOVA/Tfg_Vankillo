// ignore_for_file: prefer_const_constructors, avoid_print, sized_box_for_whitespace

import 'package:banquillosl/Login/Login_Or_RegisterPage.dart';
import 'package:banquillosl/pages/HomeEntrenador.dart';
import 'package:banquillosl/pages/HomeJugador.dart';
import 'package:banquillosl/pages/HomeUsuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Auth extends StatefulWidget {
  Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final db = FirebaseFirestore.instance;

  Future<String?> getUserType(User? user) async {
    try {
      if (user != null) {
        final querySnapshot = await db.collection('users').doc(user.uid).get();

        if (querySnapshot.exists) {
          final userData = querySnapshot.data();
          if (userData != null && userData.containsKey('tipo')) {
            return userData['tipo'];
          }
        }
      }
    } catch (e) {
      print('Error getting user type: $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Lottie.network(
                    'https://assets1.lottiefiles.com/packages/lf20_NRU0Ze.json'),
              ),
            );
          } else if (snapshot.hasData) {
            final user = snapshot.data;
            return FutureBuilder(
              future: getUserType(user),
              builder: (context, futureSnapshot) {
                if (futureSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      child: Lottie.network(
                          'https://assets1.lottiefiles.com/packages/lf20_NRU0Ze.json'),
                    ),
                  );
                } else if (futureSnapshot.hasData) {
                  final tipoUsuario = futureSnapshot.data;
                  if (tipoUsuario == 'entrenador') {
                    return HomeEntrenador();
                  } else if (tipoUsuario == 'usuario') {
                    return HomeUsuario();
                  } else if (tipoUsuario == 'jugador') {
                    return HomeJugador();
                  }
                }
                return Text('Error');
              },
            );
          } else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
