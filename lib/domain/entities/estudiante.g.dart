// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estudiante.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Estudiante _$EstudianteFromJson(Map<String, dynamic> json) => Estudiante(
  id: json['id'] as String,
  nombreCompleto: json['nombreCompleto'] as String,
  correo: json['correo'] as String,
  contrasenaHash: json['contrasenaHash'] as String,
  fechaRegistro: DateTime.parse(json['fechaRegistro'] as String),
  departamento: json['departamento'] as String,
  municipio: json['municipio'] as String,
  grado: json['grado'] as String,
  clasesICFES:
      (json['clasesICFES'] as List<dynamic>)
          .map((e) => ClaseICFES.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$EstudianteToJson(Estudiante instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombreCompleto': instance.nombreCompleto,
      'correo': instance.correo,
      'contrasenaHash': instance.contrasenaHash,
      'fechaRegistro': instance.fechaRegistro.toIso8601String(),
      'departamento': instance.departamento,
      'municipio': instance.municipio,
      'grado': instance.grado,
      'clasesICFES': instance.clasesICFES,
    };
