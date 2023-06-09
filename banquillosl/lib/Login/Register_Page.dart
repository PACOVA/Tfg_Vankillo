// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, use_build_context_synchronously, avoid_print, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, unused_element

import 'package:banquillosl/Login/NuevaContrasena.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final EmailController = TextEditingController();
  final db = FirebaseFirestore.instance;
  final PasswordController = TextEditingController();
  final UsuarioController = TextEditingController();
  bool camposCompletos = false;
  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Lottie.network(
              'https://assets1.lottiefiles.com/packages/lf20_NRU0Ze.json'),
        );
      },
    );

    final user = <String, dynamic>{
      "Email": EmailController.text,
      "Usuario": UsuarioController.text,
      "tipo": 'usuario'
    };

    try {
      final authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: EmailController.text, password: PasswordController.text);

      db.collection("users").doc(authResult.user!.uid).set(user);

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      ErrorLogin(e.code);
    }
  }

  void ErrorLogin(String mensaje) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            mensaje,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  Widget BotonCrear() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35.0),
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              // Actualizar el estado de los controladores de texto
            });

            if (EmailController.text.isNotEmpty &&
                PasswordController.text.isNotEmpty &&
                UsuarioController.text.isNotEmpty) {
              signUserUp();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: EmailController.text.isNotEmpty &&
                    PasswordController.text.isNotEmpty &&
                    UsuarioController.text.isNotEmpty
                ? Color.fromRGBO(0, 150, 249, 1)
                : Color.fromRGBO(0, 76, 126, 100),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
          ),
          child: Text(
            "Crear cuenta",
            style: TextStyle(
              color: EmailController.text.isNotEmpty &&
                      PasswordController.text.isNotEmpty &&
                      UsuarioController.text.isNotEmpty
                  ? Color.fromRGBO(255, 255, 255, 1)
                  : Color.fromRGBO(161, 161, 161, 100),
              fontSize: 20,
            ),
          )),
    );
  }

  void comprobarCamposCompletos() {
    setState(() {
      camposCompletos =
          PasswordController.text.isNotEmpty && EmailController.text.isNotEmpty;
    });
  }

  bool _obscureText = true;
  Widget CampoContrasena() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
      child: TextField(
        controller: PasswordController,
        onChanged: (value) {
          comprobarCamposCompletos();
        },
        style: TextStyle(color: Colors.white),
        obscureText: _obscureText,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: "Contraseña",
          hintStyle: TextStyle(color: Color.fromRGBO(161, 161, 161, 100)),
          fillColor: Color.fromRGBO(37, 37, 37, 100),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            color: Color.fromRGBO(161, 161, 161, 100),
          ),
          filled: true,
        ),
      ),
    );
  }

  Widget CampoEmail(controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          comprobarCamposCompletos();
        },
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: "Email",
          hintStyle: TextStyle(color: Color.fromRGBO(161, 161, 161, 100)),
          fillColor: Color.fromRGBO(37, 37, 37, 100),
          filled: true,
        ),
      ),
    );
  }

  Widget CampoUsuario(controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          comprobarCamposCompletos();
        },
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: "Nombre de Usuario",
          hintStyle: TextStyle(color: Color.fromRGBO(161, 161, 161, 100)),
          fillColor: Color.fromRGBO(37, 37, 37, 100),
          filled: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 210,
              ),
              Titulo(),
              SizedBox(
                height: 100,
              ),
              CrearCuentaText(),
              CampoUsuario(UsuarioController),
              CampoEmail(EmailController),
              CampoContrasena(),
              OlvidadoContrasena(context),
              BotonCrear(),
              CrearCuenta(context, widget.onTap),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Titulo() {
  return Text(
    "Vankillo SL",
    style: TextStyle(fontSize: 45, color: Colors.white),
  );
}

Widget OlvidadoContrasena(context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NuevaContrasena(),
                ),
              ),
            },
            child: Text(
              "¿Has olvidado la contraseña?",
              style: TextStyle(
                color: Color.fromRGBO(33, 140, 212, 100),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 30,
        )
      ],
    ),
  );
}

Widget CrearCuenta(context, onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "¿Tienes Cuenta?",
        style: TextStyle(color: Colors.white70),
      ),
      SizedBox(width: 5),
      GestureDetector(
        onTap: onTap,
        child: Text(
          " Inicia Secion",
          style: TextStyle(
            color: Color.fromRGBO(33, 140, 212, 100),
          ),
        ),
      ),
    ],
  );
}

Widget CrearCuentaText() {
  return Padding(
    padding: const EdgeInsets.only(left: 40, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Crear Cuenta",
          style:
              TextStyle(color: Color.fromRGBO(208, 211, 212, 1), fontSize: 15),
        ),
      ],
    ),
  );
}
