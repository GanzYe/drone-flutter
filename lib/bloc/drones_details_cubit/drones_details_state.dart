part of 'drones_details_cubit.dart';

class DronesDetailsState extends Equatable {
  const DronesDetailsState({
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage = '',
    this.drones = const [],
  });

  final String errorMessage;
  final FormzSubmissionStatus status;
  final List<DroneModel> drones;

  @override
  List<Object?> get props => [
        errorMessage,
        status,
        drones,
      ];

  DronesDetailsState copyWith({
    String? errorMessage,
    FormzSubmissionStatus? status,
    List<DroneModel>? drones,
  }) =>
      DronesDetailsState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        drones: drones ?? this.drones,
      );
}
