// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulacro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Simulacro _$SimulacroFromJson(Map<String, dynamic> json) => Simulacro(
  id: json['_id'] as String,
  titulo: json['titulo'] as String,
  area: json['area'] as String,
  estado: json['estado'] as String,
  listaIdPreguntas:
      (json['lista_id_preguntas'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  listaOpcionesCorrectas:
      (json['lista_opciones_correctas'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  listaOpcionesEscogidas:
      (json['lista_opciones_escogidas'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
);

Map<String, dynamic> _$SimulacroToJson(Simulacro instance) => <String, dynamic>{
  '_id': instance.id,
  'titulo': instance.titulo,
  'area': instance.area,
  'estado': instance.estado,
  'lista_id_preguntas': instance.listaIdPreguntas,
  'lista_opciones_correctas': instance.listaOpcionesCorrectas,
  'lista_opciones_escogidas': instance.listaOpcionesEscogidas,
};
