// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../models/date_model.dart';
import 'horizontal_calendario.dart';
import 'lista_partidos.dart';

class LigasHomeScreen extends StatefulWidget {
  const LigasHomeScreen({super.key});

  @override
  State<LigasHomeScreen> createState() => _LigasHomeScreenState();
}

class _LigasHomeScreenState extends State<LigasHomeScreen> {
  List<DateModel>? dates;
  String todayDateIs = "25";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black87,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber[900]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70.0),
                          child: Text(
                            'Ligas y partidos',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 8, 116)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 80,
                            height: 80,
                            child: Lottie.network(
                                'https://assets2.lottiefiles.com/packages/lf20_rEFATf.json'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: HorizontalCalendar(),
                ),
                Container(
                  height: 900,
                  width: double.infinity,
                  child: PartidosWidget(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
