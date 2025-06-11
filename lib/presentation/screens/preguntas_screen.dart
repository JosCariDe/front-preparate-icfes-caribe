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
  late PreguntasService preguntaService;
  List<Pregunta> preguntas = [];
  bool isLoading = true;
  int _currentQuestionIndex = 0; // Nuevo: Índice de la pregunta actual

  @override
  void initState() {
    super.initState();
    preguntaService = PreguntasService();
    _cargarPreguntasInicial();
  }

  Future<void> _cargarPreguntasInicial() async {
    final idPreguntas = widget.simulacro.listaIdPreguntas;
    if (idPreguntas != null && idPreguntas.isNotEmpty) {
      List<Pregunta> loadedPreguntas = [];
      for (var id in idPreguntas) {
        try {
          final pregunta = await preguntaService.getPreguntasById(id);
          if (pregunta != null) {
            loadedPreguntas.add(pregunta);
          }
        } catch (e) {
          print('ERROR al cargar pregunta con ID $id: $e');
          // Puedes manejar el error de forma más robusta aquí, por ejemplo, mostrando un mensaje al usuario.
        }
      }
      setState(() {
        preguntas = loadedPreguntas;
        isLoading = false;
        _currentQuestionIndex = 0; // Asegura que el índice se reinicie al cargar
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < preguntas.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Opcional: Navegar a una pantalla de resultados o finalizar el simulacro
        print('DEBUG: Fin del simulacro.');
        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => ResultadosScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final simulacro = widget.simulacro;
    final cantidadPreguntas = simulacro.listaIdPreguntas?.length ?? 0;
    // Actualiza el contador de preguntas respondidas
    final contadorPreguntasRespondidas = _currentQuestionIndex;

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
                  value: cantidadPreguntas > 0 ? (_currentQuestionIndex / cantidadPreguntas) : 0, // Progreso basado en el índice
                ),
                SizedBox(height: 16),
                isLoading
                    ? const CircularProgressIndicator()
                    : preguntas.isEmpty
                        ? const Text('No hay preguntas disponibles')
                        : Column(
                            children: [
                              SizedBox(
                                height: 520,
                                child: Column(
                                  children: [
                                    Text(
                                      preguntas[_currentQuestionIndex].enunciado, // Muestra la pregunta actual
                                      style: TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: preguntas[_currentQuestionIndex].opciones.map((opcion) {
                                        return Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 7),
                                            child: Text(
                                              '${opcion.letra}.   ${opcion.texto}',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              // Aquí irían las opciones de respuesta, si las tuvieras
                              // Por ahora, solo el botón de siguiente
                              ElevatedButton(
                                onPressed: _currentQuestionIndex < preguntas.length - 1
                                    ? _nextQuestion
                                    : null, // Deshabilita el botón si es la última pregunta
                                style: ButtonStyle(
                                  textStyle: WidgetStateProperty.all<TextStyle>(
                                    TextStyle(fontSize: 20, color: Colors.white)
                                  ),
                                ),
                                child: Text(
                                  _currentQuestionIndex < preguntas.length - 1
                                      ? 'Siguiente Pregunta'
                                      : 'Finalizar Simulacro',
                                ),
                                
                              ),
                            ],
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
