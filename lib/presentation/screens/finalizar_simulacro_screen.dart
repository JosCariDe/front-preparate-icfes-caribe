
import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:caribe_app/domain/entities/simulacro.dart';
import 'package:caribe_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class FinalizarSimulacroScreen extends StatelessWidget {
  final Simulacro simulacro;
  const FinalizarSimulacroScreen({super.key, required this.simulacro});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Simulacro Finalizado',
                  style: TextStyle(
                    fontSize: 30,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '¡Felicidades! Has completado el simulacro "${simulacro.titulo}".',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => HomeScreen()));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(primaryColor),
                  ),
                  child: Text(
                    'Volver al Inicio',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}