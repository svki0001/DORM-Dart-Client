// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dorm_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DORMResponse _$DORMResponseFromJson(Map<String, dynamic> json) => DORMResponse(
      body: json['body'] as Map<String, dynamic>,
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => Map<String, String>.from(e as Map))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DORMResponseToJson(DORMResponse instance) =>
    <String, dynamic>{
      'body': instance.body,
      'errors': instance.errors,
    };
