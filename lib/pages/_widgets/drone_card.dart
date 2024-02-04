import 'package:drone/config/app_theme.dart';
import 'package:drone/models/drone_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DroneCard extends StatelessWidget {
  const DroneCard({
    super.key,
    required this.drone,
  });

  final DroneModel drone;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppTheme.dialogInnerPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DecoratedBox(
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: AppTheme.background,
                        ),
                        child: Padding(
                          padding: AppTheme.dialogInnerPadding,
                          child: Center(
                            child: Image.asset(
                              'assets/icons/drone-4.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppTheme.spacingMWidth,
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'UAS ID:',
                        style: AppTheme.bodyS.copyWith(
                          color: AppTheme.background,
                        ),
                      ),
                      Text(
                        '${drone.uasId}',
                        style: AppTheme.bodyXS.copyWith(
                          color: AppTheme.background,
                        ),
                      ),
                      AppTheme.spacingXSHeight,
                      Text(
                        'Last seen:',
                        style: AppTheme.bodyS.copyWith(
                          color: AppTheme.background,
                        ),
                      ),
                      Text(
                        DateFormat('HH:mm - dd MMMM').format(
                          DateTime.parse(
                            drone.lastSeen!,
                          ),
                        ),
                        style: AppTheme.bodyXS.copyWith(
                          color: AppTheme.background,
                        ),
                      ),
                      AppTheme.spacingXSHeight,
                      Text(
                        r'Track angle | Speed:',
                        style: AppTheme.bodyS.copyWith(
                          color: AppTheme.background,
                        ),
                      ),
                      Text(
                        '${drone.trackAngle!} | ${drone.speed!}',
                        style: AppTheme.bodyXS.copyWith(
                          color: AppTheme.background,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
              color: AppTheme.white.withOpacity(0.2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Latitude:',
                      style: AppTheme.bodyS.copyWith(
                        color: AppTheme.background,
                      ),
                    ),
                    Text(
                      '${drone.location!.latitude}',
                      style: AppTheme.bodyXS.copyWith(
                        color: AppTheme.background,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      r'Longitude:',
                      style: AppTheme.bodyS.copyWith(
                        color: AppTheme.background,
                      ),
                    ),
                    Text(
                      '${drone.location!.longitude}',
                      style: AppTheme.bodyXS.copyWith(
                        color: AppTheme.background,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      r'Altitude:',
                      style: AppTheme.bodyS.copyWith(
                        color: AppTheme.background,
                      ),
                    ),
                    Text(
                      '${drone.location!.altitude}',
                      style: AppTheme.bodyXS.copyWith(
                        color: AppTheme.background,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
}
