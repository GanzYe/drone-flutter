import 'package:drone/config/app_theme.dart';
import 'package:drone/pages/_widgets/date_range_picker_field.dart';
import 'package:drone/pages/_widgets/name_input.dart';
import 'package:drone/pages/_widgets/number_input.dart';
import 'package:drone/pages/_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PlanFlightCard extends StatelessWidget {
  const PlanFlightCard({
    super.key,
    required this.draggableScrollableController,
  });

  final DraggableScrollableController draggableScrollableController;

  @override
  Widget build(BuildContext context) => DraggableScrollableSheet(
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
                      'Plan new flight',
                      style:
                          AppTheme.labelM.copyWith(color: AppTheme.background),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.57 - 31,
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
                          dateRangePickerView: DateRangePickerView.month,
                          onChanged: (DateTimeRange value) {},
                        ),
                        AppTheme.spacingSHeight,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
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
      );
}
