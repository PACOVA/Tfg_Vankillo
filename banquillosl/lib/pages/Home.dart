// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, annotate_overrides, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, non_constant_identifier_names

import 'package:banquillosl/Ligas/LigasHomeScreen.dart';
import 'package:banquillosl/homeScreen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'PerfilEntrenador.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _paginaActual = 0;
  List<Widget> _pagina = [Home(), PerfilEntrenador(), LigasHomeScreen()];
  void CerrarSecion() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BanquilloHome',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              CerrarSecion();
            },
          ),
        ),
        body: _pagina[_paginaActual],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ligas"),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), label: "User"),
          ],
        ),
      ),
    );
  }
}
