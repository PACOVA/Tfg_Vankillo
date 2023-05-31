// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Noticias {
  String? noticias;
  AssetImage? imagen;
  String? imagenURL;
  Noticias(this.noticias, {this.imagen, this.imagenURL});
}

class DummiData {
  static final task = <Noticias>[
    Noticias('El Unicaja de Málaga se prepara para la nueva temporada '),
    Noticias(
        'La cantera del Basket Málaga continúa produciendo jóvenes talentos'),
    Noticias('victoria en casa ante el líder de la liga.'),
  ];
}

class NoticiasImagen {
  String? noticias;
  String? imagenURL;
  NoticiasImagen(this.noticias, this.imagenURL);
}
