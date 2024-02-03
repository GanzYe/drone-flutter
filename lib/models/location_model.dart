import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class LocationModel extends Equatable {
  const LocationModel({
    required this.latitude,
    required this.longitude,
    required this.altitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  final double? latitude;
  final double? longitude;
  final double? altitude;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        altitude,
      ];
}
