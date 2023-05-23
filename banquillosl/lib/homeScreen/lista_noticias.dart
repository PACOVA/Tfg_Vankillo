// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:banquillosl/Noticias/noticias_view.dart';
import 'package:banquillosl/models/noticias.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NoticiasWidget extends StatefulWidget {
  const NoticiasWidget({super.key});

  @override
  State<NoticiasWidget> createState() => _NoticiasWidgetState();
}

class _NoticiasWidgetState extends State<NoticiasWidget> {
  List<Noticias> noticias = [];

  void initState() {
    noticias = List.of(DummiData.task);
    super.initState();
  }

  removeData(index) {
    setState(() {
      noticias.removeAt(index);
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
        itemCount: noticias.length,
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
  }

  Widget listTile(int index) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  width: 120,
                  margin: EdgeInsets.only(right: 10, left: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/balonc_mock.jpg',
                      height: 90,
                      width: 100,
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  width: 120,
                  child: Text(
                    noticias[index].noticias.toString(),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.amber[900], fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    child: Text(
                      noticias[index].noticias.toString(),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  height: 90,
                  width: 120,
                  margin: EdgeInsets.only(right: 10, left: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/bask.jpg',
                      height: 90,
                      width: 100,
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
/* */