// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, prefer_final_fields, use_build_context_synchronously

import 'package:banquillosl/Ligas/LigasHomeScreen.dart';
import 'package:banquillosl/Ligas/ListaLigas.dart';
import 'package:banquillosl/homeScreen/home.dart';
import 'package:banquillosl/perfilUsuario/perfil_screen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeUsuario extends StatefulWidget {
  const HomeUsuario({Key? key}) : super(key: key);

  @override
  State<HomeUsuario> createState() => _HomeUsuarioState();
}

class _HomeUsuarioState extends State<HomeUsuario> {
  int _paginaActual = 0;
  List<Widget> _pagina = [
    Home(),
    LigasHomeScreen(),
    ListaLigas(),
    PerfilUsuario()
  ];

  void CerrarSecion() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banquillo',
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
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black, // Color de fondo del BottomNavigationBar
          ),
          child: BottomNavigationBar(
            selectedItemColor: Colors.amber[900],
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              setState(() {
                _paginaActual = index;
              });
            },
            currentIndex: _paginaActual,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_tree_rounded), label: "Partidos"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_sharp), label: "Clasificacion"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle), label: "Usuario"),
            ],
          ),
        ),
      ),
    );
  }
}
