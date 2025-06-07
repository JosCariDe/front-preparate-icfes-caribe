import 'package:json_annotation/json_annotation.dart';
import 'package:caribe_app/domain/entities/clase_icfes.dart';

part 'estudiante.g.dart'; // Archivo generado automáticamente

@JsonSerializable()
class Estudiante {
  final String id;
  final String nombreCompleto;
  final String correo;
  final String contrasenaHash;
  final DateTime fechaRegistro;
  final String departamento;
  final String municipio;
  final String grado;
  final List<ClaseICFES> clasesICFES;

  Estudiante({
    required this.id,
    required this.nombreCompleto,
    required this.correo,
    required this.contrasenaHash,
    required this.fechaRegistro,
    required this.departamento,
    required this.municipio,
    required this.grado,
    required this.clasesICFES,
  });

  factory Estudiante.fromJson(Map<String, dynamic> json) => _$EstudianteFromJson(json);
  Map<String, dynamic> toJson() => _$EstudianteToJson(this);
}
