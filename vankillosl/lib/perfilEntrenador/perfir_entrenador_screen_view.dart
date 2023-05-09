import 'package:flutter/material.dart';
import 'package:vankillosl/perfilJugador/perfil_screen_view.dart';

import '../homeScreen/user_info_home.dart';
import '../perfilJugador/mi_usuario_jugador/perfil_usuario_view.dart';
import 'equipo/equipo_tab.dart';

class PerfilEntrenador extends StatefulWidget {
  @override
  _PerfilEntrenadorState createState() => _PerfilEntrenadorState();
}

class _PerfilEntrenadorState extends State<PerfilEntrenador>
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
                      Container(child: Tab(text: 'Equipo')),
                      Container(
                        child: Tab(text: 'Ingresar Jugador'),
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
                      // Contents of 'Mi perfil' tab
                      Container(
                        color: Colors.black54,
                        child: EntrenadorEquipoView(),
                      ),

                      // Contents of 'Mi equipo' tab
                      PerfilUsuarioView()
                    ],
                  ),
                ),
              ),
              Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      '¡VankilloSL!, Ruben OreroLevy y toh my nabo',
                      style: TextStyle(fontSize: 13),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
