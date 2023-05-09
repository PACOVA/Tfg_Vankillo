// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, annotate_overrides, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
//import 'package:vankillosl/Noticias/noticias_view.dart';
import 'package:vankillosl/homeScreen/home.dart';
//import 'package:vankillosl/perfilJugador/perfil_screen_view.dart';

import 'ligas/ligas_home_screen.dart';
import 'perfilEntrenador/perfir_entrenador_screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(new Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KiriHome',
      //theme: ThemeData(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  final controllerPage = [
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black,
      child: Center(
        child: HomePage(),
      ),
    ),
    Center(
      child: LigasHomeScreen(),
    ),
    Center(
      child: Text('page4'),
    ),
    PerfilEntrenador(),
  ];

  Widget build(BuildContext context) => Container(
        /*decoration: BoxDecoration(
          image: DecorationImage(
            // image: AssetImage('backGround.png'),
            fit: BoxFit.cover,
          ),
        ),*/
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: controllerPage[index],
            bottomNavigationBar: NavigationBar(
              height: 50,
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.new_releases_outlined),
                  label: 'Noticias',
                  selectedIcon: Icon(Icons.new_releases_rounded),
                ),
                NavigationDestination(
                  icon: Icon(Icons.account_tree_outlined),
                  label: 'Ligas',
                  selectedIcon: Icon(Icons.account_tree_rounded),
                ),
                NavigationDestination(
                  icon: Icon(Icons.article_outlined),
                  label: 'Clasificacion',
                  selectedIcon: Icon(Icons.article_rounded),
                ),
                NavigationDestination(
                  icon: Icon(Icons.people_alt_outlined),
                  label: 'Mi equipo',
                  selectedIcon: Icon(Icons.people_alt_rounded),
                ),
              ],
            ),
          ),
        ),
      );
}
