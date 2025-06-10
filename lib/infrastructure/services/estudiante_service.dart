import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:caribe_app/domain/entities/estudiante.dart';

class EstudianteService {
  final String _baseUrl = 'http://10.0.2.2:5100';

  Future<List<Estudiante>> getEstudiantes() async {
    final response = await http.get(Uri.parse('$_baseUrl/estudiantes'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> data =
          jsonResponse['data']; //? Accede a la clave 'data'
      print('Datos obtenidos de la petición de estudiantes: $data');
      return data.map((json) => Estudiante.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load estudiantes: ${response.statusCode}');
    }
  }

  Future<Estudiante> loginEstudiante(String correo, String contrasena) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {'Content-type': 'application/json'},
      body: json.encode({'correo': correo, 'contrasena': contrasena}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      if (jsonResponse.containsKey('data')) {
        return Estudiante.fromJson(jsonResponse['data']);
      } else {
        return Estudiante.fromJson(
          jsonResponse,
        ); // Si el estudiante está directamente en la raíz
      }
    } else {
      // Manejo de errores de autenticación (ej. credenciales inválidas)
      final Map<String, dynamic> errorResponse = json.decode(response.body);
      throw Exception(
        errorResponse['message'] ??
            'Error de autenticación: ${response.statusCode}',
      );
    }
  }

  Future<Estudiante> registerEstudiante(
    String nombreCompleto,
    String correo,
    String contrasena,
    String departamento,
    String municipio,
    String grado,
  ) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/register'),
      headers: {'Content-type': 'application/json'},
      body: json.encode({'nombre_completo': nombreCompleto, 'correo': correo, 'contrasena': contrasena, 'departamento':departamento, 'municipio': municipio, 'grado': grado}),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      
      if (jsonResponse.containsKey('data')) {
        return Estudiante.fromJson(jsonResponse['data']);
      } else {
        return Estudiante.fromJson(
          jsonResponse,
        ); // Si el estudiante está directamente en la raíz
      }
    } else {
      // Manejo de errores de autenticación (ej. credenciales inválidas)
      final Map<String, dynamic> errorResponse = json.decode(response.body);
      throw Exception(
        errorResponse['message'] ??
            'Error Al crear un estudiante: ${response.statusCode}',
      );
    }
  }
}
