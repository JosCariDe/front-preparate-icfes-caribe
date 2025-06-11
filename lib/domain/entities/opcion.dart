import 'package:json_annotation/json_annotation.dart';

part 'opcion.g.dart';

@JsonSerializable()
class Opcion {
  @JsonKey(name: '_id')
  final String id;
  final String letra;
  final String texto;

  Opcion({required this.id, required this.letra, required this.texto});
  

  factory Opcion.fromJson(Map<String, dynamic> json) =>
      _$OpcionFromJson(json);

  Map<String, dynamic> toJson() => _$OpcionToJson(this);
}
