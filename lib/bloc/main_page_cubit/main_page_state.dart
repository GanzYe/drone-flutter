part of 'main_page_cubit.dart';

class MainPageState extends Equatable {
  const MainPageState({
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage = '',
    this.markers = const {},
    this.circles = const {},
    this.selectedDrone,
  });

  final String errorMessage;
  final FormzSubmissionStatus status;
  final Set<Marker> markers;
  final Set<Circle> circles;
  final DroneModel? selectedDrone;

  @override
  List<Object?> get props => [
        errorMessage,
        status,
        markers,
        circles,
        selectedDrone,
      ];

  MainPageState copyWith({
    String? errorMessage,
    FormzSubmissionStatus? status,
    List<DroneModel>? drones,
    Set<Circle>? circles,
    Set<Marker>? markers,
    DroneModel? selectedDrone,
    bool? clearSelectedDrone,
  }) =>
      MainPageState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        circles: circles ?? this.circles,
        markers: markers ?? this.markers,
        selectedDrone: clearSelectedDrone == true
            ? null
            : selectedDrone ?? this.selectedDrone,
      );
}
