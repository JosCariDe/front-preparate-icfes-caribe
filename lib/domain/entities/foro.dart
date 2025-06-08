import 'package:json_annotation/json_annotation.dart';

part 'foro.g.dart';

@JsonSerializable()
class Foro {
  @JsonKey(name: '_id')
  final String id;
  final String nombre;
  final String? descripcion;
  final String creador;
  final DateTime fecha;

  Foro({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.creador,
    required this.fecha,
  });

  factory Foro.fromJson(Map<String, dynamic> json) => _$ForoFromJson(json);
  Map<String, dynamic> toJson() => _$ForoToJson(this);
}
