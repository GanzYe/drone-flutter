part of 'plan_flight_cubit.dart';

class PlanFlightState extends Equatable {
  const PlanFlightState({
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage = '',
    this.location = const LocationModel(),
    this.uasID = const UasID.pure(),
    this.altitude = const AltitudeModel(),
    this.dateStart,
    this.dateEnd,
  });

  final String errorMessage;
  final FormzSubmissionStatus status;
  final LocationModel location;
  final UasID uasID;
  final AltitudeModel altitude;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  @override
  List<Object?> get props => [
        errorMessage,
        status,
        location,
        uasID,
        altitude,
        dateStart,
        dateEnd,
      ];

  PlanFlightState copyWith({
    String? errorMessage,
    FormzSubmissionStatus? status,
    LocationModel? location,
    UasID? uasID,
    AltitudeModel? altitude,
    DateTime? dateStart,
    DateTime? dateEnd,
  }) =>
      PlanFlightState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        location: location ?? this.location,
        uasID: uasID ?? this.uasID,
        altitude: altitude ?? this.altitude,
        dateStart: dateStart ?? this.dateStart,
        dateEnd: dateEnd ?? this.dateEnd,
      );
}
