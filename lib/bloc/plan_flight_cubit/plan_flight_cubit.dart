import 'package:drone/data/repositories/drone_repository.dart';
import 'package:drone/dependency_injection.dart';
import 'package:drone/models/altitude_model.dart';
import 'package:drone/models/location_model.dart';
import 'package:drone/models/uas_id_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'plan_flight_state.dart';

class PlanFlightCubit extends Cubit<PlanFlightState> {
  PlanFlightCubit() : super(const PlanFlightState());
  final DroneRepository droneRepository = getIt<DroneRepository>();

  void latitudeChanged({double? latitude}) {
    if (latitude == null) {
      emit(
        state.copyWith(
          location:
              state.location.copyWith(latitude: latitude, clearLatitude: true),
        ),
      );
      return;
    }
    emit(state.copyWith(location: state.location.copyWith(latitude: latitude)));
  }

  void longitudeChanged({double? longitude}) {
    if (longitude == null) {
      emit(
        state.copyWith(
          location: state.location
              .copyWith(longitude: longitude, clearLongitude: true),
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        location: state.location.copyWith(longitude: longitude),
      ),
    );
  }

  void radiusChanged({double? radius}) {
    if (radius == null) {
      emit(
        state.copyWith(
          location: state.location.copyWith(radius: radius, clearRadius: true),
        ),
      );
      return;
    }
    emit(state.copyWith(location: state.location.copyWith(radius: radius)));
  }

  void minChanged({double? min}) {
    if (min == null) {
      emit(
        state.copyWith(
          altitude: state.altitude.copyWith(min: min, clearMin: true),
        ),
      );
      return;
    }
    emit(state.copyWith(altitude: state.altitude.copyWith(min: min)));
  }

  void maxChanged({double? max}) {
    if (max == null) {
      emit(
        state.copyWith(
          altitude: state.altitude.copyWith(max: max, clearMax: true),
        ),
      );
      return;
    }
    emit(state.copyWith(altitude: state.altitude.copyWith(max: max)));
  }

  void dateRangeChanged({DateTime? start, DateTime? end}) {
    emit(
      state.copyWith(
        dateStart: start,
        dateEnd: end,
      ),
    );
  }

  void uasIDChanged({String? uasID}) {
    if (uasID == null) {
      emit(state.copyWith(uasID: const UasID.pure()));
      return;
    }
    emit(state.copyWith(uasID: UasID.dirty(uasID)));
  }

  void statusChanged({
    required FormzSubmissionStatus status,
    required String errorMessage,
  }) {
    emit(state.copyWith(status: status, errorMessage: errorMessage));
  }

  Future<void> sendFlight() async {
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ),
    );
    final failureOrResponse = await droneRepository.sendDrone(
      state.uasID.value,
      state.location,
      state.altitude,
      state.dateStart!,
      state.dateEnd!,
    );
    failureOrResponse.fold(
      (failure) {
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (sports) {
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.success,
          ),
        );
      },
    );
  }
}
