import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: true,
  fieldRename: FieldRename.snake,
)
class LocationModel extends Equatable {
  const LocationModel({
    this.latitude,
    this.longitude,
    this.altitude,
    this.radius,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() {
    final result = _$LocationModelToJson(this);
    return result;
  }

  final double? latitude;
  final double? longitude;
  final double? radius;
  final double? altitude;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        altitude,
        radius,
      ];

  LocationModel copyWith({
    double? latitude,
    bool? clearLatitude,
    double? longitude,
    bool? clearLongitude,
    double? radius,
    bool? clearRadius,
  }) =>
      LocationModel(
        latitude: clearLatitude == true ? null : latitude ?? this.latitude,
        longitude: clearLongitude == true ? null : longitude ?? this.longitude,
        radius: clearRadius == true ? null : radius ?? this.radius,
      );
}
