// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class NoticiasTexto extends StatelessWidget {
  const NoticiasTexto({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¡El equipo de baloncesto local gana el partido contra su rival por un amplio margen! Los jugadores mostraron una gran habilidad en la cancha, especialmente en la defensa, lo que les permitió recuperar la pelota y anotar con facilidad. El equipo ha estado entrenando duro durante toda la temporada y su dedicación y esfuerzo se ha visto reflejado en su éxito en el partido de hoy. Los aficionados celebraron con entusiasmo en las gradas mientras los jugadores se felicitaban y agradecían mutuamente por su gran actuación. ¡Un gran día para el baloncesto local!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Además, según fuentes cercanas al equipo, el entrenador está trabajando duro en la táctica defensiva para poder competir al máximo nivel en la próxima temporada. Los aficionados están muy ilusionados con el equipo y esperan poder ver grandes partidos en el pabellón de su ciudad. Sin duda, el baloncesto es uno de los deportes más emocionantes y completos, que requiere de gran habilidad técnica y física por parte de los jugadores.',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
