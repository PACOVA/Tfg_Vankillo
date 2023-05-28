// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, annotate_overrides, avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class IngresarJugador extends StatefulWidget {
  const IngresarJugador({super.key});

  @override
  State<IngresarJugador> createState() => _IngresarJugadorState();
}

class _IngresarJugadorState extends State<IngresarJugador> {
  bool isViseble = true;
  int currentStep = 0;

  continueStep() {
    setState(() {
      currentStep = currentStep + 1;
      if (currentStep == 3) {
        currentStep = 0;
      } //currentStep+=1;
    });
  }

  cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1; //currentStep-=1;
      });
    }
  }

  onStepTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }

  Widget controlBuilders(context, details) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(currentStep == 2 ? 'Fin' : 'Siguiente'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: details.onStepCancel,
            child: Text('Atras'),
          ),
        ],
      ),
    );
  }

  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.black45,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(221, 0, 0, 0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: SafeArea(
                child: Theme(
                  data: ThemeData(
                    canvasColor: Colors.black87,
                    colorScheme: Theme.of(context).colorScheme.copyWith(
                          primary: Colors.amber[900],
                          background: Colors.red,
                          secondary: Colors.amber[900],
                        ),
                  ),
                  child: Stepper(
                    elevation: 2, //Horizontal Impact
                    margin: const EdgeInsets.all(20), //vertical impact
                    controlsBuilder: controlBuilders,
                    type: StepperType.horizontal,
                    physics: const ScrollPhysics(),
                    onStepTapped: onStepTapped,
                    onStepContinue: continueStep,
                    onStepCancel: cancelStep,
                    currentStep: currentStep, //0, 1, 2
                    steps: [
                      Step(
                          title: const Text(
                            '',
                            style: TextStyle(color: Colors.white),
                          ),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                  'Para generar un QR pulsa el boton "Siguiente"',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ],
                          ),
                          isActive: currentStep >= 0,
                          state: currentStep >= 0
                              ? StepState.complete
                              : StepState.disabled),
                      Step(
                        title: const Text(
                          '',
                          style: TextStyle(color: Colors.white),
                        ),
                        content: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: QrImageView(
                              backgroundColor:
                                  const Color.fromRGBO(255, 111, 0, 1),
                              data: 'aa',
                              version: QrVersions.auto,
                              size: 300.0,
                            ),
                          ),
                        ),
                        isActive: currentStep >= 0,
                        state: currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: const Text(
                          '',
                          style: TextStyle(color: Colors.white),
                        ),
                        content: const Text('Jugador Insertado Correctamente',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        isActive: currentStep >= 0,
                        state: currentStep >= 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
