import 'package:drone/config/app_theme.dart';
import 'package:drone/pages/_widgets/primary_button.dart';
import 'package:flutter/material.dart';

Future<void> closeDialogBuilder(
  BuildContext context, {
  required String title,
}) =>
    showDialog(
      context: context,
      builder: (BuildContext context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: const EdgeInsets.only(
            top: 8,
            bottom: 24,
            right: 16.0,
            left: 16.0,
          ),
          iconPadding: const EdgeInsets.all(24.0),
          backgroundColor: AppTheme.white,
          surfaceTintColor: AppTheme.white,
          iconColor: AppTheme.white,
          actionsAlignment: MainAxisAlignment.center,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTheme.titleL,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PrimaryButton(
                  title: 'OK',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: ButtonColors(
                    enabled: AppTheme.mainColor,
                    disabled: AppTheme.black.withOpacity(0.25),
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
    );
