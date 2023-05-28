// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:banquillosl/models/noticias.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NoticiasHomeSlider extends StatefulWidget {
  const NoticiasHomeSlider({super.key});

  @override
  State<NoticiasHomeSlider> createState() => _NoticiasHomeSliderState();
}

class _NoticiasHomeSliderState extends State<NoticiasHomeSlider> {
  @override
  Widget build(BuildContext context) {
    List<NoticiasImagen> imgList = DummiImagen();
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 4),
                              child: Column(
                                children: [
                                  Text(
                                    'No. ${imgList.indexOf(item)} Title',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'No. ${imgList.indexOf(item)} subTitle',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Container(
      margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.5,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 2,
          autoPlay: true,
        ),
        items: imageSliders,
      ),
    );
  }
}
