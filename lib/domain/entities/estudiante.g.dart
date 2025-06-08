// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estudiante.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Estudiante _$EstudianteFromJson(Map<String, dynamic> json) => Estudiante(
  id: json['_id'] as String,
  nombreCompleto: json['nombre_completo'] as String,
  correo: json['correo'] as String,
  contrasenaHash: json['contrasena_hash'] as String?,
  fechaRegistro: DateTime.parse(json['fecha_registro'] as String),
  departamento: json['departamento'] as String?,
  municipio: json['municipio'] as String?,
  grado: json['grado'] as String?,
  clasesICFES:
      (json['clasesICFES'] as List<dynamic>?)
          ?.map((e) => ClaseICFES.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$EstudianteToJson(Estudiante instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nombre_completo': instance.nombreCompleto,
      'correo': instance.correo,
      'contrasena_hash': instance.contrasenaHash,
      'fecha_registro': instance.fechaRegistro.toIso8601String(),
      'departamento': instance.departamento,
      'municipio': instance.municipio,
      'grado': instance.grado,
      'clasesICFES': instance.clasesICFES,
    };
