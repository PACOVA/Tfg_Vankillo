// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:vankillosl/Noticias/noticias_view.dart';
import 'package:vankillosl/models/equipos_model.dart';
import 'package:vankillosl/models/noticias.dart';

class PartidosWidget extends StatefulWidget {
  const PartidosWidget({super.key});

  @override
  State<PartidosWidget> createState() => _PartidosWidgetState();
}

class _PartidosWidgetState extends State<PartidosWidget> {
  List<Equipos> equipos = [];
  int? indexenemi;
  List<Noticias> noticias = [];

  void initState() {
    equipos = List.of(DummiDataEquipos.equipos);
    super.initState();
  }

  removeData(index) {
    setState(() {
      equipos.removeAt(index);
    });
  }

  void _openNoticia(BuildContext ctx, Noticias noticia) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NoticiasView(noticia: noticia),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: equipos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _openNoticia(context, noticias[index]),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Slidable(
                  key: ValueKey(index),
                  endActionPane: ActionPane(
                    dismissible: DismissiblePane(
                      onDismissed: () {},
                    ),
                    motion: const BehindMotion(),
                    children: [
                      SlidableAction(
                        icon: (Icons.delete_outlined),
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.all(25),
                        flex: 1,
                        borderRadius: BorderRadius.circular(10),
                        onPressed: (context) => {removeData(index)},
                        backgroundColor: Color(0xFFFF6F00),
                      )
                    ],
                  ),
                  child: listTile(index)),
            ),
          );
        },
      ),
    );

//Icon(.check_circle_outline_rounded)
  }

  Widget listTile(int index) {
    indexenemi = index + 1;

    if (index % 2 == 0) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  child: Text(
                    equipos[index].nombre.toString(),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.amber[900], fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Center(
                    child: Container(
                      width: 60,
                      height: 80,
                      child: Lottie.network(
                          'https://assets5.lottiefiles.com/packages/lf20_cINZhW4UWL.json'),
                    ),
                  ),
                ),
                Text(
                  equipos[index + 1].nombre.toString(),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      if (index < equipos.length - 1) {
        index++;
      }

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 60,
                    child: Text(
                      equipos[index].nombre.toString(),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Center(
                    child: Container(
                      width: 60,
                      height: 80,
                      child: Lottie.network(
                          'https://assets5.lottiefiles.com/packages/lf20_cINZhW4UWL.json'),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 80,
                    child: Text(
                      equipos[index - 1].nombre.toString(),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.amber[900], fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
