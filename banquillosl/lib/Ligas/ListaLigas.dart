// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls, sized_box_for_whitespace, prefer_const_constructors

import 'package:banquillosl/Leer%20Datos/Get_ligas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ListaLigas extends StatefulWidget {
  const ListaLigas({
    super.key,
  });

  @override
  State<ListaLigas> createState() => _ListaLigasState();
}

class _ListaLigasState extends State<ListaLigas> {
  final db = FirebaseFirestore.instance;

  List<String> docId = [];

  Future GetId() async {
    await db
        .collection('Ligas')
        .orderBy('Diferencia', descending: true)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              docId.add(document.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Titulo(),
              ),
              Tabla(),
              Container(
                height: 900,
                width: double.infinity,
                child: FutureBuilder(
                  future: GetId(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: docId.length,
                      itemBuilder: (context, index) {
                        return GetLigas(documentId: docId[index]);
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget Titulo() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.amber[900]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 70.0),
          child: Text(
            'Clasificaciones',
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
  );
}

Widget Tabla() {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    child: Table(
      border: TableBorder.all(width: 1.0, color: Colors.grey),
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(),
        1: FixedColumnWidth(40),
        2: FixedColumnWidth(40),
        3: FixedColumnWidth(40),
        4: FixedColumnWidth(55),
        5: FixedColumnWidth(55),
        6: FixedColumnWidth(55),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 32,
                child: Text(
                  'Equipo',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                height: 32,
                child: Text(
                  'PJ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                height: 32,
                child: Text(
                  'V',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                height: 32,
                child: Text(
                  'D',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                height: 32,
                child: Text(
                  'Pts+',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                height: 32,
                child: Text(
                  'Pts-',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                height: 32,
                child: Text(
                  'Dif.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
