import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:caribe_app/domain/entities/simulacro.dart';
import 'package:flutter/material.dart';

class SimulacroScreen extends StatelessWidget {
  final Simulacro simulacro;
  const SimulacroScreen({super.key, required this.simulacro});

  

  @override
  Widget build(BuildContext context) {
    var cantidadPreguntas = simulacro.listaIdPreguntas?.length;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(color: primaryBackground),
          child: Column(
            children: [
              Text(simulacro.titulo, style: TextStyle()),
              SizedBox(height: 2),
              Text(
                'La siguiente prueba consta de $cantidadPreguntas ${cantidadPreguntas! > 1 ? 'preguntas': 'pregunta'}',
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
