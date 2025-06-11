import 'dart:convert';
import 'package:caribe_app/domain/entities/pregunta.dart';
import 'package:http/http.dart' as http;

class PreguntasService {
  final String _baseUrl = 'http://10.0.2.2:5100';

  Future<List<Pregunta>> getPreguntas() async {
    final url = Uri.parse('$_baseUrl/preguntas');
    print('DEBUG: Realizando petición GET a: $url');
    final response = await http.get(url);

    print('DEBUG: Estado de la respuesta para $url: ${response.statusCode}');
    print('DEBUG: Cuerpo de la respuesta para $url: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      print('DEBUG: Preguntas cargadas exitosamente.');
      return data.map((json) => Pregunta.fromJson(json)).toList();
    } else {
      print('ERROR: Fallo al cargar preguntas: ${response.statusCode}');
      throw Exception('Failed to load preguntas: ${response.statusCode}');
    }
  }

  Future<Pregunta> getPreguntasById(String id) async {
    final url = Uri.parse('$_baseUrl/preguntas/$id');
    print('DEBUG: Realizando petición GET a: $url');
    final response = await http.get(url);

    print('DEBUG: Estado de la respuesta para $url: ${response.statusCode}');
    print('DEBUG: Cuerpo de la respuesta para $url: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse.containsKey('data')) {
        print('DEBUG: Pregunta por ID cargada exitosamente (con clave "data").');
        return Pregunta.fromJson(jsonResponse['data']);
      } else {
        print('DEBUG: Pregunta por ID cargada exitosamente (sin clave "data").');
        return Pregunta.fromJson(
          jsonResponse,
        ); // Si el estudiante está directamente en la raíz
      }
    } else {
      print('ERROR: Fallo al cargar pregunta por Id: ${response.statusCode}');
      throw Exception('Failed to load pregunta by Id: ${response.statusCode}');
    }
  }
}
