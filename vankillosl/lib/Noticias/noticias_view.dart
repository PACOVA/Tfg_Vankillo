import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vankillosl/models/noticias.dart';

import 'noticias_texto_view.dart';

class NoticiasView extends StatelessWidget {
  final Noticias noticia;
  const NoticiasView({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black87,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 15,
                  ),
                  child: Container(
                    width: 200,
                    height: 60,
                    child: Lottie.network(
                        'https://assets1.lottiefiles.com/packages/lf20_eir9qziv.json'),
                  ),
                ),
                Text(
                  noticia.noticias!,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[900]),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 10, left: 5),
                  child: Image.asset(
                    'assets/balonc_mock.jpg',
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  child: Lottie.network(
                      'https://assets1.lottiefiles.com/packages/lf20_ji9iyu0p.json'),
                ),
                NoticiasTexto(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      child: Lottie.network(
                          'https://assets7.lottiefiles.com/packages/lf20_oKu1nU.json'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
