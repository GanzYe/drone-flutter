import 'dart:async';

import 'package:drone/bloc/main_page_cubit/main_page_cubit.dart';
import 'package:drone/bloc/plan_flight_cubit/plan_flight_cubit.dart';
import 'package:drone/config/app_theme.dart';
import 'package:drone/pages/_widgets/drone_card.dart';
import 'package:drone/pages/_widgets/plan_flight_card.dart';
import 'package:drone/pages/_widgets/un_focus_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static MaterialPageRoute<void> route() => MaterialPageRoute(
        settings: const RouteSettings(name: 'MainPage'),
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MainPageCubit(),
            ),
            BlocProvider(
              create: (context) => PlanFlightCubit(),
            ),
          ],
          child: const MainPage(),
        ),
      );

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late String _mapStyleString;
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();

  @override
  void initState() {
    rootBundle.loadString('assets/map_styles/map_style.json').then((string) {
      _mapStyleString = string;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MainPageCubit, MainPageState>(
        builder: (context, state) => UnFocusPage(
          child: Scaffold(
            key: const Key('MainPage'),
            resizeToAvoidBottomInset: true,
            backgroundColor: AppTheme.white,
            body: PopScope(
              canPop: false,
              onPopInvoked: (didPop) async {},
              child: Stack(
                children: [
                  GoogleMap(
                    compassEnabled: true,
                    zoomControlsEnabled: false,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      _controller.future.then((value) {
                        value.setMapStyle(_mapStyleString);
                      });
                    },
                    onTap: (_) {
                      context.read<MainPageCubit>().droneSelected();
                      _draggableScrollableController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(
                        50.074681,
                        14.446475,
                      ),
                      zoom: 11.0,
                    ),
                    markers: state.markers,
                    circles: state.circles,
                  ),
                  if (state.selectedDrone != null)
                    Positioned(
                      child: SafeArea(
                        child: Padding(
                          padding: AppTheme.dialogInsetPadding,
                          child: PhysicalModel(
                            color: AppTheme.mainColor,
                            shadowColor: Colors.black,
                            borderRadius: BorderRadius.circular(10.0),
                            elevation: 10,
                            child: DroneCard(
                              drone: state.selectedDrone!,
                            ),
                          ),
                        ),
                      ),
                    ),
                  PlanFlightCard(
                    draggableScrollableController:
                        _draggableScrollableController,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
