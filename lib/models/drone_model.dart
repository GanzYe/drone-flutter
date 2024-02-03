import 'package:drone/models/location_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drone_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class DroneModel extends Equatable {
  const DroneModel({
    required this.uasId,
    required this.lastSeen,
    required this.location,
    required this.speed,
    required this.trackAngle,
  });

  factory DroneModel.fromJson(Map<String, dynamic> json) =>
      _$DroneModelFromJson(json);

  final String? uasId;
  final String? lastSeen;
  final LocationModel? location;
  final double? speed;
  final double? trackAngle;

  @override
  List<Object?> get props => [
        uasId,
        lastSeen,
        location,
        speed,
        trackAngle,
      ];
}
