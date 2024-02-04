import 'dart:async';

import 'package:drone/bloc/main_page_cubit/main_page_cubit.dart';
import 'package:drone/config/app_theme.dart';
import 'package:drone/pages/_widgets/date_range_picker_field.dart';
import 'package:drone/pages/_widgets/drone_card.dart';
import 'package:drone/pages/_widgets/name_input.dart';
import 'package:drone/pages/_widgets/number_input.dart';
import 'package:drone/pages/_widgets/primary_button.dart';
import 'package:drone/pages/_widgets/un_focus_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static MaterialPageRoute<void> route() => MaterialPageRoute(
        settings: const RouteSettings(name: 'MainPage'),
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MainPageCubit(),
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
                        0.05,
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
                  DraggableScrollableSheet(
                    initialChildSize: 0.07,
                    minChildSize: 0.07,
                    maxChildSize: 0.57,
                    controller: _draggableScrollableController,
                    builder: (context, scrollController) => InkWell(
                      onTap: () {
                        _draggableScrollableController.animateTo(
                          1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: AppTheme.mainColor,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(25)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Plan new flight',
                                  style: AppTheme.labelM
                                      .copyWith(color: AppTheme.background),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.57 -
                                        31,
                                decoration: const BoxDecoration(
                                  color: AppTheme.background,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTheme.spacingMHeight,
                                    NameTextFormField(
                                      onChanged: (_) {},
                                      labelText: 'UAS ID',
                                    ),
                                    AppTheme.spacingSHeight,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text(
                                        'Location:',
                                        style: AppTheme.bodyM,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: NumberFormField(
                                            onChanged: (_) {},
                                            labelText: 'Latitude',
                                            stringAsFixed: 10,
                                          ),
                                        ),
                                        Expanded(
                                          child: NumberFormField(
                                            onChanged: (_) {},
                                            labelText: 'Longitude',
                                            stringAsFixed: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    NumberFormField(
                                      onChanged: (_) {},
                                      labelText: 'Radius',
                                      stringAsFixed: 10,
                                      decimal: true,
                                    ),
                                    AppTheme.spacingSHeight,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text(
                                        'Altitude:',
                                        style: AppTheme.bodyM,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: NumberFormField(
                                            onChanged: (_) {},
                                            labelText: 'Min',
                                            stringAsFixed: 10,
                                          ),
                                        ),
                                        Expanded(
                                          child: NumberFormField(
                                            onChanged: (_) {},
                                            labelText: 'Max',
                                            stringAsFixed: 10,
                                            decimal: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                    DateRangePickerField(
                                      labelText: 'Flight dates',
                                      dateRangePickerView:
                                          DateRangePickerView.month,
                                      onChanged: (DateTimeRange value) {},
                                    ),
                                    AppTheme.spacingSHeight,
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        PrimaryButton(
                                          title: 'Send flight',
                                          onPressed: () {},
                                          backgroundColor: const ButtonColors(
                                            enabled: AppTheme.mainColor,
                                            disabled: AppTheme.white,
                                          ),
                                          textColor: const TextColors(
                                            enabled: AppTheme.white,
                                            disabled: AppTheme.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
