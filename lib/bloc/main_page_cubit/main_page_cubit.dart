import 'package:drone/bloc/drones_details_cubit/drones_details_cubit.dart';
import 'package:drone/config/app_theme.dart';
import 'package:drone/dependency_injection.dart';
import 'package:drone/models/drone_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(const MainPageState()) {
    _createCircles();
    _createMarkers();
  }
  final DronesDetailsCubit dronesDetailsCubit = getIt<DronesDetailsCubit>();

  void droneSelected({DroneModel? drone}) {
    if (drone == null) {
      emit(state.copyWith(clearSelectedDrone: true, selectedDrone: null));
      return;
    }
    emit(state.copyWith(selectedDrone: drone));
  }

  Future<void> _createMarkers() async {
    final Set<Marker> markers = {};
    for (final drone in dronesDetailsCubit.state.drones) {
      final Marker marker = Marker(
        zIndex: drone.location!.altitude!,
        markerId: MarkerId(drone.uasId!),
        position: LatLng(
          drone.location!.latitude!,
          drone.location!.longitude!,
        ),
        icon: await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(),
          'assets/icons/location-64.png',
        ),
        onTap: () {
          droneSelected(drone: drone);
        },
      );
      markers.add(marker);
    }
    emit(state.copyWith(markers: markers));
  }

  void _createCircles() {
    final Set<Circle> circles = {};
    for (final drone in dronesDetailsCubit.state.drones) {
      final circle = Circle(
        circleId: CircleId(drone.uasId!),
        center: LatLng(
          drone.location!.latitude!,
          drone.location!.longitude!,
        ),
        radius: 400,
        strokeWidth: 1,
        fillColor: AppTheme.mainColor.withOpacity(0.4),
      );
      circles.add(circle);
    }
    emit(state.copyWith(circles: circles));
  }
}
