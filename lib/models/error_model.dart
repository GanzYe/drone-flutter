import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class ErrorModel extends Equatable {
  const ErrorModel({
    this.errorCode,
    this.errorMessage,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  final String? errorCode;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        errorCode,
        errorMessage,
      ];

  ErrorModel copyWith({
    String? errorCode,
    String? errorMessage,
  }) =>
      ErrorModel(
        errorCode: errorCode ?? this.errorCode,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
