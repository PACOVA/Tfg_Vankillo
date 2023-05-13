import 'package:flutter/material.dart';

class Equipos {
  String? nombre;
  AssetImage? imagen;

  Equipos(this.nombre, {this.imagen});
}

class DummiDataEquipos {
  static final equipos = <Equipos>[
    Equipos('unicaja'),
    Equipos('uniarmario'),
    Equipos('unienzimera'),
    Equipos('unicejo'),
    Equipos('unidad'),
    Equipos('unicornio'),
    Equipos('universo'),
    Equipos('uniforme'),
  ];
}
