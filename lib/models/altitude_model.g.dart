// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'altitude_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AltitudeModel _$AltitudeModelFromJson(Map<String, dynamic> json) =>
    AltitudeModel(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AltitudeModelToJson(AltitudeModel instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };
