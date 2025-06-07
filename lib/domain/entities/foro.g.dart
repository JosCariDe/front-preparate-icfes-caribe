// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Foro _$ForoFromJson(Map<String, dynamic> json) => Foro(
  id: json['id'] as String,
  titulo: json['titulo'] as String,
  descripcion: json['descripcion'] as String,
  creador: json['creador'] as String,
  fecha: DateTime.parse(json['fecha'] as String),
);

Map<String, dynamic> _$ForoToJson(Foro instance) => <String, dynamic>{
  'id': instance.id,
  'titulo': instance.titulo,
  'descripcion': instance.descripcion,
  'creador': instance.creador,
  'fecha': instance.fecha.toIso8601String(),
};
