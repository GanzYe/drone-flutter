import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'altitude_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: true,
  fieldRename: FieldRename.snake,
)
class AltitudeModel extends Equatable {
  const AltitudeModel({
    this.min,
    this.max,
  });

  factory AltitudeModel.fromJson(Map<String, dynamic> json) =>
      _$AltitudeModelFromJson(json);

  Map<String, dynamic> toJson() {
    final result = _$AltitudeModelToJson(this);
    return result;
  }

  final double? min;
  final double? max;

  @override
  List<Object?> get props => [
        min,
        max,
      ];

  AltitudeModel copyWith({
    double? min,
    bool? clearMin,
    double? max,
    bool? clearMax,
  }) =>
      AltitudeModel(
        min: clearMin == true ? null : min ?? this.min,
        max: clearMax == true ? null : max ?? this.max,
      );

  bool get isValid {
    if (min != null && max != null && min! > max!) {
      return false;
    }
    return true;
  }
}
