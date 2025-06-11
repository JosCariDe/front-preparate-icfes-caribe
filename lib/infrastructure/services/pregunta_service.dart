import 'dart:convert';
import 'package:caribe_app/domain/entities/pregunta.dart';
import 'package:http/http.dart' as http;

class PreguntasService {
  final String _baseUrl = 'http://10.0.2.2:5100';

  Future<List<Pregunta>> getPreguntas() async {
    final response = await http.get(Uri.parse('$_baseUrl/preguntas'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      return data.map((json) => Pregunta.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load preguntas: ${response.statusCode}');
    }
  }

  Future<Pregunta> getPreguntasById(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/preguntas/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse.containsKey('data')) {
        return Pregunta.fromJson(jsonResponse['data']);
      } else {
        return Pregunta.fromJson(
          jsonResponse,
        ); // Si el estudiante está directamente en la raíz
      }
    } else {
      throw Exception('Failed to load pregunta by Id: ${response.statusCode}');
    }
  }
}
