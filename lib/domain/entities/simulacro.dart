import 'package:json_annotation/json_annotation.dart';

part 'simulacro.g.dart';

@JsonSerializable()
class Simulacro {
  @JsonKey(name: '_id')
  final String id;
  final String titulo;
  final String area;
  final String estado;
  @JsonKey(name: 'lista_id_preguntas')
  final List<String>? listaIdPreguntas;
  @JsonKey(name: 'lista_opciones_correctas')
  final List<String>? listaOpcionesCorrectas;
  @JsonKey(name: 'lista_opciones_escogidas')
  final List<String>? listaOpcionesEscogidas;

  Simulacro({
    required this.id,
    required this.titulo,
    required this.area,
    required this.estado,
    required this.listaIdPreguntas,
    required this.listaOpcionesCorrectas,
    required this.listaOpcionesEscogidas,
  });

  factory Simulacro.fromJson(Map<String, dynamic> json) => _$SimulacroFromJson(json);
  Map<String, dynamic> toJson() => _$SimulacroToJson(this);
}
