// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../homeScreen/user_info_home.dart';
import 'mi_usuario_jugador/perfil_usuario_view.dart';

class PerfilJugador extends StatefulWidget {
  @override
  _PerfilJugadorState createState() => _PerfilJugadorState();
}

class _PerfilJugadorState extends State<PerfilJugador>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black45,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: UserInfoHomePage(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: TabBar(
                    indicatorColor: Colors.amber[900],
                    labelColor: Colors.amber[900],
                    controller: _tabController,
                    tabs: [
                      Container(child: Tab(text: 'Mi perfil')),
                      Container(
                        child: Tab(text: 'Mi equipo'),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        color: Colors.black54,
                        child: PerfilUsuarioView(),
                      ),
                      Center(
                        child: Text(''),
                      ),
                    ],
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
