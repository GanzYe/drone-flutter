import 'package:drone/data/repositories/drone_repository.dart';
import 'package:drone/dependency_injection.dart';
import 'package:drone/models/drone_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'drones_details_state.dart';

class DronesDetailsCubit extends Cubit<DronesDetailsState> {
  DronesDetailsCubit() : super(const DronesDetailsState()) {
    getDrones();
  }

  final DroneRepository droneRepository = getIt<DroneRepository>();

  Future<void> getDrones() async {
    final failureOrResponse = await droneRepository.getDrones();
    failureOrResponse.fold(
      (failure) {
        late String errorMessage;
        if (failure == 404) {
          errorMessage = 'Not Found';
        }
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.failure,
            errorMessage: errorMessage,
          ),
        );
      },
      (sports) {
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.success,
            drones: sports,
          ),
        );
      },
    );
  }
}
