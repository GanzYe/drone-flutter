import 'package:drone/models/altitude_model.dart';
import 'package:drone/models/location_model.dart';
import 'package:drone/models/uas_id_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'plan_flight_state.dart';

class PlanFlightCubit extends Cubit<PlanFlightState> {
  PlanFlightCubit() : super(const PlanFlightState());

  void latitudeChanged({double? latitude}) {
    // if (drone == null) {
    //   emit(state.copyWith(clearSelectedDrone: true, selectedDrone: null));
    //   return;
  }
  // emit(state.copyWith(location: ));
}
