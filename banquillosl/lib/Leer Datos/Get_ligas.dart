// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetLigas extends StatelessWidget {
  const GetLigas({super.key, required this.documentId});
  final String documentId;
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Ligas');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
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
                          child: AutoSizeText(
                            data['Equipo'],
                            textAlign: TextAlign.justify,
                            maxLines: 1,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          height: 32,
                          child: AutoSizeText(
                            '${data['PJ']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          height: 32,
                          child: AutoSizeText(
                            '${data['V']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          height: 32,
                          child: AutoSizeText(
                            '${data['D']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          height: 32,
                          child: AutoSizeText(
                            '${data['Pts+']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          height: 32,
                          child: AutoSizeText(
                            '${data['Pts-']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          height: 32,
                          child: AutoSizeText(
                            '${data['Diferencia']}',
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
          return Text(
            'Cargando ...',
            style: TextStyle(fontSize: 26, color: Colors.white),
          );
        }));
  }
}
