import 'package:drone/config/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonColors {
  const ButtonColors({
    required this.enabled,
    required this.disabled,
  });

  final Color enabled;
  final Color disabled;
}

class TextColors {
  const TextColors({
    required this.enabled,
    required this.disabled,
  });

  final Color enabled;
  final Color disabled;
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.active = true,
    this.isLoading = false,
    required this.onPressed,
    this.leadingIcon,
    this.lastIcon,
    this.buttonColor,
    required this.textColor,
    this.mainAxisSize = MainAxisSize.min,
    required this.backgroundColor,
  });

  final String title;
  final bool active;
  final bool isLoading;
  final String? leadingIcon;
  final String? lastIcon;
  final Color? buttonColor;
  final TextColors textColor;
  final ButtonColors backgroundColor;
  final MainAxisSize mainAxisSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            active ? backgroundColor.enabled : backgroundColor.disabled,
          ),
          foregroundColor: MaterialStateProperty.all(AppTheme.background),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
          ),
        ),
        onPressed: active && !isLoading ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: mainAxisSize,
          children: [
            if (!isLoading)
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTheme.labelL.copyWith(
                  color: active ? textColor.disabled : textColor.enabled,
                ),
              )
            else
              SizedBox(
                height: 20.0,
                width: 20.0,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  backgroundColor: AppTheme.white.withOpacity(.1),
                  color: backgroundColor.enabled.computeLuminance() > 0.5 ||
                          backgroundColor.enabled == Colors.transparent
                      ? AppTheme.black.withOpacity(.4)
                      : AppTheme.white,
                ),
              ),
          ],
        ),
      );
}
