import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:caribe_app/domain/entities/estudiante.dart';

class EstudianteService {
  final String _baseUrl = 'http://localhost:5100';

  Future<List<Estudiante>> getEstudiantes() async {
    final response = await http.get(Uri.parse('$_baseUrl/estudiantes')); 

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data']; //? Accede a la clave 'data'

      return data.map((json) => Estudiante.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load estudiantes: ${response.statusCode}');
    }
  }

}
