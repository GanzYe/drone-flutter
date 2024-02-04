import 'package:drone/bloc/plan_flight_cubit/plan_flight_cubit.dart';
import 'package:drone/config/app_theme.dart';
import 'package:drone/pages/_widgets/date_range_picker_field.dart';
import 'package:drone/pages/_widgets/number_input.dart';
import 'package:drone/pages/_widgets/primary_button.dart';
import 'package:drone/pages/_widgets/uas_id_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PlanFlightCard extends StatelessWidget {
  const PlanFlightCard({
    super.key,
    required this.draggableScrollableController,
  });

  final DraggableScrollableController draggableScrollableController;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PlanFlightCubit, PlanFlightState>(
        builder: (context, state) => DraggableScrollableSheet(
          initialChildSize: 0.07,
          minChildSize: 0.07,
          maxChildSize: 0.57,
          controller: draggableScrollableController,
          builder: (context, scrollController) => InkWell(
            onTap: () {
              draggableScrollableController.animateTo(
                1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              controller: scrollController,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppTheme.mainColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Plan a new flight',
                        style: AppTheme.labelM
                            .copyWith(color: AppTheme.background),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.57 -
                              31 +
                              (40 * state.notValidLength),
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
                              const UasIDInput(),
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
                                      onChanged: (value) {
                                        context
                                            .read<PlanFlightCubit>()
                                            .latitudeChanged(latitude: value);
                                      },
                                      initialValue: state.location.latitude,
                                      labelText: 'Latitude',
                                      stringAsFixed: 10,
                                      decimal: true,
                                    ),
                                  ),
                                  Expanded(
                                    child: NumberFormField(
                                      onChanged: (value) {
                                        context
                                            .read<PlanFlightCubit>()
                                            .longitudeChanged(longitude: value);
                                      },
                                      initialValue: state.location.longitude,
                                      labelText: 'Longitude',
                                      stringAsFixed: 10,
                                      decimal: true,
                                    ),
                                  ),
                                ],
                              ),
                              NumberFormField(
                                onChanged: (value) {
                                  context
                                      .read<PlanFlightCubit>()
                                      .radiusChanged(radius: value);
                                },
                                labelText: 'Radius',
                                stringAsFixed: 2,
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
                                      onChanged: (value) {
                                        context
                                            .read<PlanFlightCubit>()
                                            .minChanged(min: value);
                                      },
                                      labelText: 'Min',
                                      stringAsFixed: 2,
                                      decimal: true,
                                      validator: (_) {
                                        if (state.altitude.min != null &&
                                            state.altitude.max != null) {
                                          if (state.altitude.min! >
                                              state.altitude.max!) {
                                            return 'Min value cann\'t be greater than max value';
                                          }
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: NumberFormField(
                                      onChanged: (value) {
                                        context
                                            .read<PlanFlightCubit>()
                                            .maxChanged(max: value);
                                      },
                                      labelText: 'Max',
                                      stringAsFixed: 2,
                                      decimal: true,
                                      validator: (_) {
                                        if (state.altitude.min != null &&
                                            state.altitude.max != null) {
                                          if (state.altitude.min! >
                                              state.altitude.max!) {
                                            return 'Max value cann\'t be less than  min value';
                                          }
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              DateRangePickerField(
                                labelText: 'Flight dates',
                                dateRangePickerView: DateRangePickerView.month,
                                onChanged: (DateTimeRange value) {
                                  context
                                      .read<PlanFlightCubit>()
                                      .dateRangeChanged(
                                        start: value.start,
                                        end: value.end,
                                      );
                                },
                              ),
                              AppTheme.spacingSHeight,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PrimaryButton(
                                    isLoading: state.status ==
                                        FormzSubmissionStatus.inProgress,
                                    active: state.isValid,
                                    title: 'Send flight',
                                    onPressed: () {
                                      context
                                          .read<PlanFlightCubit>()
                                          .sendFlight();
                                    },
                                    backgroundColor: ButtonColors(
                                      enabled: AppTheme.mainColor,
                                      disabled:
                                          AppTheme.black.withOpacity(0.25),
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
                        if (state.status == FormzSubmissionStatus.inProgress)
                          Positioned.fill(
                            child: Container(
                              color: Colors.black.withOpacity(0.15),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: AppTheme.refreshIndicatorColor,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
