import 'package:drone/bloc/drones_details_cubit/drones_details_cubit.dart';
import 'package:drone/config/app_theme.dart';
import 'package:drone/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static MaterialPageRoute<void> route() => MaterialPageRoute<void>(
        builder: (_) => const SplashPage(),
      );

  void _navigateToIntro(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MainPage.route(),
    );
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<DronesDetailsCubit, DronesDetailsState>(
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            _navigateToIntro(context);
          }
        },
        child: Scaffold(
          backgroundColor: AppTheme.splashBG,
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Drone',
                  style: AppTheme.titleLargeBold500
                      .copyWith(color: AppTheme.mainColor),
                  textAlign: TextAlign.start,
                ),
                Text(
                  'Map',
                  style: AppTheme.titleLargeBold700
                      .copyWith(color: AppTheme.secondColor),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      );
}
