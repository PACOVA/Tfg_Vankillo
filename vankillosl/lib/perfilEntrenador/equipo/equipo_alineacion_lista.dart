import 'dart:math';

import 'package:flutter/material.dart';

class EqupoAlineacion extends StatefulWidget {
  const EqupoAlineacion({Key? key}) : super(key: key);

  @override
  _EqupoAlineacionState createState() => _EqupoAlineacionState();
}

class _EqupoAlineacionState extends State<EqupoAlineacion> {
  List<Offset> positions = List.generate(
    10,
    (index) => Offset(35.0 * index, 10.0),
  );

  int numDragged = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 320,
          width: 500,
          child: Container(
            child: Image.asset(
              'assets/pista_vankillo.PNG',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        ...List.generate(
          positions.length,
          (index) => Positioned(
            left: positions[index].dx,
            top: positions[index].dy,
            child: GestureDetector(
                onPanUpdate: (details) {
                  if (numDragged < 5) {
                    positions[index] += details.delta;
                    setState(() {});
                  }
                },
                onTap: () {},
                child: index < 5
                    ? Container(
                        margin: EdgeInsets.only(left: 5, right: 23),
                        height: 35,
                        width: 35,
                        child: CircleAvatar(
                          backgroundColor: Colors.black45,
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.transparent, BlendMode.color),
                            child: Image.asset(
                              'assets/camisa_alineacion.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(left: 23, right: 5),
                        height: 35,
                        width: 35,
                        child: CircleAvatar(
                          backgroundColor: Colors.black45,
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.transparent, BlendMode.color),
                            child: Image.asset(
                              'assets/camisa_alineacion_adversario.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
          ),
        )
      ],
    );
  }
}
