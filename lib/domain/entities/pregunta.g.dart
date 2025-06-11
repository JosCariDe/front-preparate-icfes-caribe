// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregunta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pregunta _$PreguntaFromJson(Map<String, dynamic> json) => Pregunta(
  id: json['_id'] as String,
  area: json['area'] as String,
  tema: json['tema'] as String,
  enunciado: json['enunciado'] as String,
  urlImagen: json['url_imagen'] as String?,
  opciones:
      (json['opciones'] as List<dynamic>)
          .map((e) => Opcion.fromJson(e as Map<String, dynamic>))
          .toList(),
  explicacionCorrecta: json['explicacion_correcta'] as String,
);

Map<String, dynamic> _$PreguntaToJson(Pregunta instance) => <String, dynamic>{
  '_id': instance.id,
  'area': instance.area,
  'tema': instance.tema,
  'enunciado': instance.enunciado,
  'url_imagen': instance.urlImagen,
  'opciones': instance.opciones,
  'explicacion_correcta': instance.explicacionCorrecta,
};
