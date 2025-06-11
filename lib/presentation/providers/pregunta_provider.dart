import 'package:caribe_app/domain/entities/pregunta.dart';
import 'package:caribe_app/infrastructure/services/pregunta_service.dart';
import 'package:flutter/material.dart';

class PreguntaProvider extends ChangeNotifier {
  final PreguntasService preguntaService;
  Pregunta? _pregunta;
  bool _isLoading = false;
  String? _errorMEssage;

  PreguntaProvider({required this.preguntaService});

  Pregunta? get pregunta => _pregunta;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMEssage;

  Future<void> loadPreguntas() async {
    _isLoading = true;
    _errorMEssage = null;
    notifyListeners();

    try {
      final preguntas = await preguntaService.getPreguntas();
      if (preguntas.isNotEmpty) {
        _pregunta = preguntas.first;
      } else {
        _pregunta = null;
        _errorMEssage = 'No se encontraron preguntas';
      }
    } catch (e) {
      _errorMEssage = 'Error al cargar preguntas: ${e.toString()}';
      _pregunta = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadPreguntaById(String idPregunta) async {
    _isLoading = true;
    _errorMEssage = null;
    notifyListeners();

    try {
      _pregunta = await preguntaService.getPreguntasById(idPregunta);
    } catch (e) {
      _errorMEssage = 'Error al cargar preguntas: ${e.toString()}';
      _pregunta = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<List<Pregunta>> loadPreguntasByListId(List<String> idsPreguntas) async {
    _isLoading = true;
    _errorMEssage = null;
    notifyListeners();
    List<Pregunta> preguntasCargadas = [];

    try {
      // Como la API no tiene una ruta para obtener preguntas por lista de IDs,
      // iteramos sobre los IDs y llamamos a getPreguntasById para cada uno.
      for (String id in idsPreguntas) {
        final pregunta = await preguntaService.getPreguntasById(id);
        preguntasCargadas.add(pregunta);
      }
    } catch (e) {
      _errorMEssage = 'Error al cargar preguntas por lista de IDs: ${e.toString()}';
      preguntasCargadas = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return preguntasCargadas;
  }
}
