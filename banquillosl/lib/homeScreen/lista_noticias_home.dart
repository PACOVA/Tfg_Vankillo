// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'lista_noticias.dart';

class ListaNoticiasHome extends StatefulWidget {
  const ListaNoticiasHome({super.key});

  @override
  State<ListaNoticiasHome> createState() => _ListaNoticiasHomeState();
}

class _ListaNoticiasHomeState extends State<ListaNoticiasHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 6),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 8,
                color: Colors.black87,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Noticias y Eventos!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amber[900]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 200,
              height: 80,
              child: Lottie.network(
                  'https://assets1.lottiefiles.com/packages/lf20_azpTu300sx.json'),
            ),
          ),
          Container(
            height: 600,
            width: double.infinity,
            child: NoticiasWidget(),
          )
        ],
      ),
    );
  }
}
