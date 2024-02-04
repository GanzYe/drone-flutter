import 'dart:async';

import 'package:drone/bloc/drones_details_cubit/drones_details_cubit.dart';
import 'package:drone/config/app_theme.dart';
import 'package:drone/models/drone_model.dart';
import 'package:drone/pages/_widgets/un_focus_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static MaterialPageRoute<void> route() => MaterialPageRoute(
        builder: (BuildContext context) => const MainPage(),
      );

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late String _mapStyleString;
  final Set<Marker> _markers = {};
  final Set<Circle> _circles = {};

  @override
  void initState() {
    rootBundle.loadString('assets/map_styles/map_style.json').then((string) {
      _mapStyleString = string;
    });
    _createMarkers(context.read<DronesDetailsCubit>().state.drones);
    _createCircles(context.read<DronesDetailsCubit>().state.drones);
    super.initState();
  }

  Future<void> _createMarkers(List<DroneModel> drones) async {
    for (final coordinate in drones) {
      final Marker marker = Marker(
        zIndex: coordinate.location!.altitude!,
        markerId: MarkerId(coordinate.uasId!),
        position: LatLng(
          coordinate.location!.latitude!,
          coordinate.location!.longitude!,
        ),
        icon: await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(),
          'assets/icons/location-64.png',
        ),
      );
      setState(() {
        _markers.add(marker);
      });
    }
  }

  void _createCircles(List<DroneModel> drones) {
    final Set<Circle> circles = {};
    for (final coordinate in drones) {
      final circle = Circle(
        circleId: CircleId(coordinate.uasId!),
        center: LatLng(
          coordinate.location!.latitude!,
          coordinate.location!.longitude!,
        ),
        radius: 400,
        strokeWidth: 1,
        fillColor: AppTheme.mainColor.withOpacity(0.4),
      );
      setState(() {
        _circles.add(circle);
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DronesDetailsCubit, DronesDetailsState>(
        builder: (context, state) => UnFocusPage(
          child: Scaffold(
            key: const Key('MainPage'),
            resizeToAvoidBottomInset: true,
            backgroundColor: AppTheme.white,
            body: PopScope(
              canPop: false,
              onPopInvoked: (didPop) async {},
              child: GoogleMap(
                compassEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  _controller.future.then((value) {
                    value.setMapStyle(_mapStyleString);
                  });
                },
                initialCameraPosition: const CameraPosition(
                  target: LatLng(
                    50.074681,
                    14.446475,
                  ),
                  zoom: 11.0,
                ),
                markers: _markers,
                circles: _circles,
              ),
            ),
          ),
        ),
      );
}
