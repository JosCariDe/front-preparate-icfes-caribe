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

  // Método para cargar todos los estudiantes (mantenerlo para HomeScreen si es necesario)
  Future<void> loadEstudiantes() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final estudiantes = await estudianteService.getEstudiantes();
      if (estudiantes.isNotEmpty) {
        _estudiante = estudiantes.first; // Tomamos el primer estudiante de la lista
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

  // Nuevo método para iniciar sesión
  Future<bool> login(String correo, String contrasena) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _estudiante = await estudianteService.loginEstudiante(correo, contrasena);
      _isLoading = false;
      notifyListeners();
      return true; // Inicio de sesión exitoso
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', ''); 
      _estudiante = null;
      _isLoading = false;
      notifyListeners();
      return false; // Inicio de sesión fallido
    }
  }

  Future<bool> register(String nombreCompleto,
    String correo,
    String contrasena,
    String departamento,
    String municipio,
    String grado,
    ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _estudiante = await estudianteService.registerEstudiante(nombreCompleto, correo , contrasena, departamento, municipio, grado);
      _isLoading = false;
      notifyListeners();
      return true; // Inicio de sesión exitoso
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', ''); 
      _estudiante = null;
      _isLoading = false;
      notifyListeners();
      return false; // Inicio de sesión fallido
    }
  }

  // Método para cerrar sesión 
  void logout() {
    _estudiante = null;
    _errorMessage = null;
    notifyListeners();
  }
}
