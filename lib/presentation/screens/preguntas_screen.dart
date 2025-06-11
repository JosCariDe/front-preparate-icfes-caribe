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
  // 1. Declara estas variables a nivel de clase
  late PreguntasService preguntaService;
  List<Pregunta> preguntas = []; // Inicializa como lista vacía
  bool isLoading = true; // Añade un estado de carga

  @override
  void initState() {
    super.initState(); // Siempre llama a super.initState() primero

    // 2. Inicializa el servicio
    preguntaService = PreguntasService();

    // 3. Llama a la función de carga de preguntas
    _cargarPreguntasInicial();
  }

  // Renombra la función para evitar conflictos y hacerla privada
  Future<void> _cargarPreguntasInicial() async {
    final idPreguntas = widget.simulacro.listaIdPreguntas;
    if (idPreguntas != null && idPreguntas.isNotEmpty) {
      List<Pregunta> loadedPreguntas = [];
      for (var id in idPreguntas) {
        final pregunta = await preguntaService.getPreguntasById(id);
        if (pregunta != null) { // Asegúrate de que la pregunta no sea nula
          loadedPreguntas.add(pregunta);
        }
      }
      setState(() {
        preguntas = loadedPreguntas;
        isLoading = false; // Marca que la carga ha terminado
      });
    } else {
      setState(() {
        isLoading = false; // No hay preguntas para cargar
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final simulacro = widget.simulacro;
    final cantidadPreguntas = simulacro.listaIdPreguntas?.length;
    final contadorPreguntasRespondidas = 0;

    // Elimina estas líneas de aquí, ya que se movieron a nivel de clase
    // final PreguntasService preguntaService = PreguntasService();
    // var idPreguntas = widget.simulacro.listaIdPreguntas;
    // List<Pregunta>? preguntas = [];

    // Elimina esta función de aquí, ya que se movió y renombró
    // void cargarPreguntas(List<String> preguntasId) async { ... }

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
                // 4. Muestra un indicador de carga o el contenido cuando esté listo
                isLoading
                    ? const CircularProgressIndicator() // Muestra un spinner mientras carga
                    : preguntas.isNotEmpty
                        ? Text(preguntas[0].enunciado)
                        : const Text('No hay preguntas disponibles'), // Maneja el caso sin preguntas
              ],
            ),
          ),
        ),
      ),
    );
  }
}
