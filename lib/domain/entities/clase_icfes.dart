import 'package:json_annotation/json_annotation.dart';
import 'package:caribe_app/domain/entities/foro.dart';
import 'package:caribe_app/domain/entities/simulacro.dart';

part 'clase_icfes.g.dart';

@JsonSerializable()
class ClaseICFES {
  final String id;
  final String nombreClase;
  final String profesor;
  final List<Foro> foros;
  final List<Simulacro> simulacros;

  ClaseICFES({
    required this.id,
    required this.nombreClase,
    required this.profesor,
    required this.foros,
    required this.simulacros,
  });

  factory ClaseICFES.fromJson(Map<String, dynamic> json) => _$ClaseICFESFromJson(json);
  Map<String, dynamic> toJson() => _$ClaseICFESToJson(this);
}
