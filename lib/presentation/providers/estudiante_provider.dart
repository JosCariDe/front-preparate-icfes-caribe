import 'package:flutter/material.dart';
import 'package:caribe_app/domain/entities/estudiante.dart';
import 'package:caribe_app/infrastructure/services/estudiante_service.dart';

class EstudianteProvider extends ChangeNotifier {
  final EstudianteService estudianteService;
  Estudiante? _estudiante; // Usaremos solo el primer estudiante por ahora
  bool _isLoading = false;
  String? _errorMessage;

  EstudianteProvider({required this.estudianteService});

  Estudiante? get estudiante => _estudiante;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadEstudiantes() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final estudiantes = await estudianteService.getEstudiantes();
      if (estudiantes.isNotEmpty) {
        _estudiante = estudiantes.first; //TODO Tomamos el primer estudiante de la lista
      } else {
        _estudiante = null;
        _errorMessage = 'No se encontraron estudiantes.';
      }
    } catch (e) {
      _errorMessage = 'Error al cargar estudiantes: ${e.toString()}';
      _estudiante = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
