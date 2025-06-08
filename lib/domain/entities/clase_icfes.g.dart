// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clase_icfes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClaseICFES _$ClaseICFESFromJson(Map<String, dynamic> json) => ClaseICFES(
  id: json['_id'] as String,
  nombreClase: json['nombre_clase'] as String,
  profesor: json['profesor'] as String,
  foros:
      (json['foros'] as List<dynamic>?)
          ?.map((e) => Foro.fromJson(e as Map<String, dynamic>))
          .toList(),
  simulacros:
      (json['simulacros'] as List<dynamic>?)
          ?.map((e) => Simulacro.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ClaseICFESToJson(ClaseICFES instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nombre_clase': instance.nombreClase,
      'profesor': instance.profesor,
      'foros': instance.foros,
      'simulacros': instance.simulacros,
    };
