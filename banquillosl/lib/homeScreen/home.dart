// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:banquillosl/homeScreen/user_info_home.dart';
import 'package:flutter/material.dart';

import 'lista_noticias_home.dart';
import 'noticias_slider_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black87,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                UserInfoHomePage(),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: NoticiasHomeSlider(),
                ),
                ListaNoticiasHome(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
