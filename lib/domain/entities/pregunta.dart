import 'package:caribe_app/domain/entities/opcion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pregunta.g.dart';

@JsonSerializable()
class Pregunta {
  @JsonKey(name: '_id')
  final String id;
  final String area;
  final String tema;
  final String enunciado;
  @JsonKey(name: 'url_imagen')
  final String? urlImagen;
  final List<Opcion> opciones;
  @JsonKey(name: 'explicacion_correcta')
  final String explicacionCorrecta;

  Pregunta({required this.id, required this.area, required this.tema, required this.enunciado, this.urlImagen, required this.opciones, required this.explicacionCorrecta});

  factory Pregunta.fromJson(Map<String, dynamic> json) =>
      _$PreguntaFromJson(json);


  Map<String, dynamic> toJson() => _$PreguntaToJson(this);
}
