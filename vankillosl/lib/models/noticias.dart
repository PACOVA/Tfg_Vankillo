import 'package:flutter/material.dart';

class Noticias {
  String? noticias;
  AssetImage? imagen;

  Noticias(this.noticias, {this.imagen});
}

class DummiData {
  static final task = <Noticias>[
    Noticias('El Unicaja de Málaga se prepara para la nueva temporada '),
    Noticias(
        'La cantera del Basket Málaga continúa produciendo jóvenes talentos'),
    Noticias('victoria en casa ante el líder de la liga.'),
  ];
}
