import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:caribe_app/domain/entities/simulacro.dart';
import 'package:caribe_app/presentation/screens/preguntas_screen.dart';
import 'package:flutter/material.dart';

class SimulacroScreen extends StatelessWidget {
  final Simulacro simulacro;
  const SimulacroScreen({super.key, required this.simulacro});

  @override
  Widget build(BuildContext context) {
    var cantidadPreguntas = simulacro.listaIdPreguntas?.length;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryBackground,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: primaryBackground),
            child: Column(
              children: [
                Text(
                  simulacro.titulo,
                  style: TextStyle(
                    fontSize: 30,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'La siguiente prueba consta de $cantidadPreguntas ${cantidadPreguntas! > 1 ? 'preguntas' : 'pregunta'}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PreguntasScreen(simulacro: simulacro,)),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      primaryColor,
                    ),
                  ),
                  child: Text(
                    'STATR',
                    style: TextStyle(color: primaryBackground, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
