import 'package:drone/models/drone_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'drones_details_state.dart';

class DronesDetailsCubit extends Cubit<DronesDetailsState> {
  DronesDetailsCubit() : super(const DronesDetailsState());
}
