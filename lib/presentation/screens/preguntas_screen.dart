import 'package:caribe_app/config/theme/app_theme.dart';
import 'package:caribe_app/domain/entities/pregunta.dart';
import 'package:caribe_app/domain/entities/simulacro.dart';
import 'package:caribe_app/infrastructure/services/pregunta_service.dart';
import 'package:caribe_app/presentation/screens/finalizar_simulacro_screen.dart';
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
  String? _selectedOption; // Nuevo: Opción seleccionada para la pregunta actual

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
    if (_selectedOption == null) {
      // No se ha seleccionado ninguna opción, no avanzar
      return;
    }
    setState(() {
      // Aquí podrías guardar la respuesta seleccionada si fuera necesario
      // Por ejemplo: _respuestasUsuario[_currentQuestionIndex] = _selectedOption;

      if (_currentQuestionIndex < preguntas.length - 1) {
        _currentQuestionIndex++;
        _selectedOption = null; // Reiniciar la selección para la siguiente pregunta
      } else {
        print('DEBUG: Fin del simulacro.');
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
                                    if (preguntas[_currentQuestionIndex].urlImagen != null)
                                      Image.network(
                                        preguntas[_currentQuestionIndex].urlImagen!,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      )
                                    else
                                      SizedBox(height: 1), // Espacio vacío si no hay imagen
                                    SizedBox(height: 20), // Añadir un SizedBox para separar la imagen de las opciones
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: preguntas[_currentQuestionIndex].opciones.map((opcion) {
                                        return Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 7),
                                            child: InkWell( // Usar InkWell para detectar toques
                                              onTap: () {
                                                setState(() {
                                                  _selectedOption = opcion.letra; // Actualizar la opción seleccionada
                                                });
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                padding: const EdgeInsets.all(15.0), // Añadir padding para el texto
                                                decoration: BoxDecoration(
                                                  color: _selectedOption == opcion.letra ? primaryColor : Colors.white, // Cambiar color si está seleccionada
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey.withOpacity(0.2),
                                                      spreadRadius: 1,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 3),
                                                    ),
                                                  ],
                                                ),
                                                child: Text(
                                                  '${opcion.letra}.   ${opcion.texto}',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: _selectedOption == opcion.letra ? Colors.white : Colors.black, // Cambiar color del texto
                                                  ),
                                                ),
                                              ),
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
                                onPressed: _selectedOption == null
                                    ? null // Deshabilita el botón si no hay opción seleccionada
                                    : _currentQuestionIndex < preguntas.length - 1
                                        ? _nextQuestion
                                        : () => Navigator.push(context, MaterialPageRoute(builder:(context) => FinalizarSimulacroScreen(simulacro: simulacro))),
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
