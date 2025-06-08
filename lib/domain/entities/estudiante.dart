import 'package:json_annotation/json_annotation.dart';
import 'package:caribe_app/domain/entities/clase_icfes.dart';

part 'estudiante.g.dart'; // Archivo generado automáticamente

@JsonSerializable()
class Estudiante {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'nombre_completo')
  final String nombreCompleto;
  final String correo;
  @JsonKey(name: 'contrasena_hash')
  final String? contrasenaHash;
  @JsonKey(name: 'fecha_registro') // Hacemos nullable
  final DateTime fechaRegistro;
  final String? departamento; // Hacemos nullable
  final String? municipio; // Hacemos nullable
  final String? grado; // Hacemos nullable
  final List<ClaseICFES>? clasesICFES;

  Estudiante({
    required this.id,
    required this.nombreCompleto,
    required this.correo,
    this.contrasenaHash, // Ya no es required
    required this.fechaRegistro,
    this.departamento, // Ya no es required
    this.municipio, // Ya no es required
    this.grado, // Ya no es required
    required this.clasesICFES,
  });

  factory Estudiante.fromJson(Map<String, dynamic> json) => _$EstudianteFromJson(json);
  Map<String, dynamic> toJson() => _$EstudianteToJson(this);
}
