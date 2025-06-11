import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:caribe_app/domain/entities/pregunta.dart';
import 'package:caribe_app/domain/entities/simulacro.dart';
import 'package:caribe_app/infrastructure/services/pregunta_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreguntasScreen extends StatefulWidget {
  final Simulacro simulacro;
  const PreguntasScreen({super.key, required this.simulacro});

  @override
  State<PreguntasScreen> createState() => _PreguntasScreenState();
}

class _PreguntasScreenState extends State<PreguntasScreen> {
  @override
  Widget build(BuildContext context) {
    final simulacro = widget.simulacro;
    final cantidadPreguntas = simulacro.listaIdPreguntas?.length;
    final contadorPreguntasRespondidas = 0;

    final PreguntasService preguntaService = PreguntasService();

    var idPreguntas = widget.simulacro.listaIdPreguntas;
    List<Pregunta>? preguntas = [];

    if (idPreguntas!.isNotEmpty) {
      for (var i = 0; i < cantidadPreguntas!; i++) {
        preguntas.add(
          preguntaService.getPreguntasById(idPreguntas[i]) as Pregunta,
      );
    }
    }

    

    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryBackground,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  widget.simulacro.titulo,
                  style: TextStyle(
                    fontSize: 30,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Preguntas respondidas: $contadorPreguntasRespondidas/$cantidadPreguntas',
                  style: TextStyle(fontSize: 16),
                ),
                LinearProgressIndicator(
                  value: (contadorPreguntasRespondidas * 10) / 50,
                ),
                SizedBox(height: 16),
                Text(preguntas[0].enunciado),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
