import 'dart:mirrors';

import 'package:dorm_client/dorm_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dorm_response.g.dart';

@JsonSerializable()
class DORMResponse {
  final Map<String, dynamic> body;
  final List<Map<String, String>> errors;

  DORMResponse({
    required this.body,
    this.errors = const [],
  });

  List<T>? rows<T>(T Function(dynamic) toElement) {
    ClassMirror mirrow = reflectClass(T);
    print(mirrow.metadata);
    DORMTable table = mirrow.metadata.firstWhere((metadata) {
      print(metadata.reflectee);
      return metadata.reflectee is DORMTable;
    }).reflectee;

    List<dynamic>? bodyRows = body[table.tableName]["rows"];

    List<T> result = bodyRows != null ? bodyRows.map(toElement).toList() : [];

    return result;
  }

  factory DORMResponse.fromJson(Map<String, dynamic> json) => _$DORMResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DORMResponseToJson(this);
}
