import 'package:json_annotation/json_annotation.dart';

part 'simulacro.g.dart';

@JsonSerializable()
class Simulacro {
  final String id;
  final String titulo;
  final String area;
  final int cantidadPreguntas;
  final String estado;

  Simulacro({
    required this.id,
    required this.titulo,
    required this.area,
    required this.cantidadPreguntas,
    required this.estado,
  });

  factory Simulacro.fromJson(Map<String, dynamic> json) => _$SimulacroFromJson(json);
  Map<String, dynamic> toJson() => _$SimulacroToJson(this);
}
