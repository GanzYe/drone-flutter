// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DroneModel _$DroneModelFromJson(Map<String, dynamic> json) => DroneModel(
      uasId: json['uas_id'] as String?,
      lastSeen: json['last_seen'] as String?,
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      speed: (json['speed'] as num?)?.toDouble(),
      trackAngle: (json['track_angle'] as num?)?.toDouble(),
    );
