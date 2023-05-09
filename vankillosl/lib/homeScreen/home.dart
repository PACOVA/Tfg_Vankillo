//<===||::r::u::b::e::n::>
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:vankillosl/homeScreen/user_info_home.dart';

import 'lista_noticias_home.dart';
import 'noticias_slider_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return
        /* decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('backGround.png'),
          fit: BoxFit.cover,
        ),
      ),*/
        Scaffold(
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
                //NoticiasWidget()
                //SearchBarKiri(),
                //CarousellArticleSlider(),
                //DropdownTask(),
                /*
                Container(
                    margin: EdgeInsets.only(top: 6),
                    child: WeeklyTaskHomeScreen())
                    */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
