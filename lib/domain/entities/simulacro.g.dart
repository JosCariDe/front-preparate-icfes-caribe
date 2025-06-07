// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulacro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Simulacro _$SimulacroFromJson(Map<String, dynamic> json) => Simulacro(
  id: json['id'] as String,
  titulo: json['titulo'] as String,
  area: json['area'] as String,
  cantidadPreguntas: (json['cantidadPreguntas'] as num).toInt(),
  estado: json['estado'] as String,
);

Map<String, dynamic> _$SimulacroToJson(Simulacro instance) => <String, dynamic>{
  'id': instance.id,
  'titulo': instance.titulo,
  'area': instance.area,
  'cantidadPreguntas': instance.cantidadPreguntas,
  'estado': instance.estado,
};
