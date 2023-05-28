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

class DummiImagen {
  static final noticiciasImagen = <NoticiasImagen>[
    NoticiasImagen('El Unicaja de Málaga',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHXre4VAVb1aRdR_CPfkm6feK91TTPhVGfBujceW7FEfnOcvx1WGUgM8Jik15hKV9AJ6Q&usqp=CAU'),
    NoticiasImagen('La cantera del Basket Málaga ',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHXre4VAVb1aRdR_CPfkm6feK91TTPhVGfBujceW7FEfnOcvx1WGUgM8Jik15hKV9AJ6Q&usqp=CAU'),
    NoticiasImagen('victoria en casa',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHXre4VAVb1aRdR_CPfkm6feK91TTPhVGfBujceW7FEfnOcvx1WGUgM8Jik15hKV9AJ6Q&usqp=CAU'),
  ];
}
