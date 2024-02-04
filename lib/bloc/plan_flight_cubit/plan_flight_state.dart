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
    bool? clearStart,
    DateTime? dateEnd,
    bool? clearEnd,
  }) =>
      PlanFlightState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        location: location ?? this.location,
        uasID: uasID ?? this.uasID,
        altitude: altitude ?? this.altitude,
        dateStart: clearStart == true ? null : dateStart ?? this.dateStart,
        dateEnd: clearEnd == true ? null : dateEnd ?? this.dateEnd,
      );

  int get notValidLength {
    int length = 0;
    if (!uasID.isPure && uasID.isNotValid) {
      length++;
    }
    if (dateStart != null && dateEnd != null) {
      if (dateStart!.isAfter(dateEnd!)) {
        length++;
      }
    }
    if (!altitude.isValid) {
      length++;
    }
    return length;
  }

  bool get isValid {
    if (uasID.isNotValid ||
        dateStart == null ||
        dateEnd == null ||
        location.longitude == null ||
        location.latitude == null ||
        location.radius == null ||
        !altitude.isValid ||
        altitude.min == null ||
        altitude.max == null) {
      return false;
    }
    return true;
  }
}
