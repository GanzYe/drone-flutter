import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color black = Color(0xFF16171A);
  static const Color grey50 = Color(0xFFEBECED);
  static const Color grey40 = Color(0xFF737476);
  static const Color grey30 = Color(0xFF878D96);
  static const Color grey35 = Color(0xFFF2F2F2);
  static const Color grey20 = Color(0xFF697077);
  static const Color grey10 = Color(0xFFF3F3F3);

  // static const Color grey30 = Color(0xFFEEEEEE);
  static const Color background = Color(0xFFF7F7F7);
  static Color grey30WithOpacity = const Color(0xFFA2A2A3).withOpacity(0.5);
  static Color cyan20WithOpacity75 = const Color(0xCC061727).withOpacity(0.80);
  static const Color white = Color(0xFFFFFFFF);
  static const Color cyan10 = Color(0xFF012749);
  static const Color cyan20 = Color(0xFF003A6D);
  static Color cyan20WithOpacity = const Color(0xFF003A6D).withOpacity(0.5);
  static const Color cyan70 = Color(0xFFBAE6FF);
  static const Color cyan80 = Color(0xFFE5F6FF);
  static const Color cyan90 = Color(0xFFF0FAFF);
  static Color cyan90WithOpacity = const Color(0xFFF0FAFF).withOpacity(0.5);
  static const Color goldenMetallic = Color(0xFFD4AF37);
  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFFBAFFC1);
  static const Color yellow = Color(0xFFFFF4BA);
  static const Color blue = Color(0xFF0072D6);
  static const Color orange = Color(0xFFFFDFBA);

  static const Color cardShadow = Color(0x1A000000);

  static const Color blockBackground = white;
  static const Color refreshIndicatorColor = cyan20;
  static const Color primary = cyan70;
  static const Color secondary = white;
  static const Color error = red;
  static const Color success = green;

  static Color getAttributeColor(int size) {
    if (size >= 90) {
      return green;
    } else if (size >= 80) {
      return cyan70;
    } else if (size >= 70) {
      return orange;
    } else if (size >= 60) {
      return yellow;
    } else {
      return red;
    }
  }

  // Flushbar
  static const flushbarMargin =
      EdgeInsets.symmetric(horizontal: 34.0, vertical: 26.0);
  static const flushbarPadding =
      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
  static const flushbarBorderRadius = BorderRadius.all(Radius.circular(12.0));

  static const avatarRadius = 32.0;

  //Buttons
  static const fieldButtonHeight = 56.0;

  static const hugeButtonHeight = 57.0;
  static const largeButtonHeight = 40.0;
  static const mediumButtonHeight = 40.0;
  static const smallButtonHeight = 40.0;

  static const hugeButtonWidth = 260.0;
  static const largeButtonWidth = 180.0;
  static const mediumButtonWidth = 150.0;
  static const smallButtonWidth = 85.0;

  static const buttonLIconSize = 20.0;

  static const appBarElevation = 0.0;
  static const bottomNavigationBarElevation = 0.0;

  static final spacingXSWidth = SizedBox(
    width: 8.0.w,
  );

  static final spacingSWidth = SizedBox(
    width: 16.0.w,
  );

  static final spacingMWidth = SizedBox(
    width: 24.0.w,
  );

  static final spacingXXSHeight = SizedBox(
    height: 4.0.h,
  );

  static final spacingXSHeight = SizedBox(
    height: 8.0.h,
  );

  static final spacingSHeight = SizedBox(
    height: 16.0.h,
  );
  static final spacingMHeight = SizedBox(
    height: 24.0.h,
  );
  static final spacingLHeight = SizedBox(
    height: 48.0.h,
  );

  // Form elements
  static const buttonRadius = BorderRadius.all(Radius.circular(24.0));
  static const buttonRadiusHuge = BorderRadius.all(Radius.circular(141.0));
  static const inputRadius = BorderRadius.all(Radius.circular(4.0));

  // Dialogs
  static const dialogInnerPaddingValue = 16.0;
  static const dialogInsetPaddingValue = 24.0;
  static const dialogInsetPadding = EdgeInsets.all(dialogInsetPaddingValue);
  static const dialogInnerPadding = EdgeInsets.all(dialogInnerPaddingValue);
  static final fieldButtonPadding =
      EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 16.0.w);
  static const defaultPagePadding = dialogInsetPadding;
  static const defaultPageWithoutAppBar =
      EdgeInsets.only(top: 80.0, right: 24.0, left: 24.0, bottom: 24.0);
  static BorderRadius dialogBorderRadius = BorderRadius.circular(16.0);

  static final lightTheme = ThemeData(
    indicatorColor: cyan20,
    colorSchemeSeed: white,
    useMaterial3: true,
    scaffoldBackgroundColor: white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(),
      bodyMedium: TextStyle(),
      bodySmall: TextStyle(),
    ).apply(
      bodyColor: cyan20,
    ),
    fontFamily: 'Poppins',
    appBarTheme: const AppBarTheme(
      backgroundColor: white,
      foregroundColor: white,
      elevation: appBarElevation,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: grey30,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      // floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 16.0),

      border: OutlineInputBorder(
        borderSide: BorderSide(color: grey30),
        borderRadius: inputRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: grey30),
        borderRadius: inputRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: grey30),
        borderRadius: inputRadius,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: grey30),
        borderRadius: inputRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red, width: 2.0),
        borderRadius: inputRadius,
      ),
      errorStyle: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: red,
      ),
      errorMaxLines: 2,

      labelStyle: TextStyle(
        backgroundColor: cyan80,
        color: cyan20,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 24.0 / 16.0,
      ),

      hintStyle: TextStyle(
        color: grey40,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 24.0 / 16.0,
      ),
    ),
    cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
      scaffoldBackgroundColor: white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      enableFeedback: true,
      showUnselectedLabels: true,
      backgroundColor: white,
      unselectedItemColor: cyan20,
      selectedItemColor: cyan20,
      elevation: bottomNavigationBarElevation,
      selectedLabelStyle: labelM,
      unselectedLabelStyle: bodyS,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(16.0),
          topStart: Radius.circular(16.0),
        ),
      ),
    ),
    sliderTheme: const SliderThemeData(
      activeTrackColor: red,
      inactiveTrackColor: white,
      trackHeight: 3.0,
      thumbColor: black,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
      trackShape: RoundedRectSliderTrackShape(),
    ),
  );

  static TextStyle titleS = TextStyle(
    fontWeight: FontWeight.w600,
    height: 20.sp / 14.sp,
    fontSize: 14.sp,
    letterSpacing: 0.1.sp,
  );

  static TextStyle titleM = TextStyle(
    fontWeight: FontWeight.w600,
    height: 24.sp / 16.sp,
    fontSize: 16.sp,
    letterSpacing: 0.15.sp,
  );

  static TextStyle titleL = TextStyle(
    fontWeight: FontWeight.w600,
    height: 28.sp / 22.sp,
    fontSize: 22.sp,
    color: cyan20,
  );

  static TextStyle titleLarge = TextStyle(
    fontWeight: FontWeight.w500,
    height: 24.sp / 20.sp,
    letterSpacing: 0.5.sp,
    fontSize: 20.sp,
  );

  static TextStyle titleLargeBold500 = TextStyle(
    fontWeight: FontWeight.w500,
    height: 52.sp / 45.sp,
    fontSize: 45.sp,
  );

  static TextStyle titleLargeBold700 = TextStyle(
    fontWeight: FontWeight.w700,
    height: 52.sp / 45.sp,
    fontSize: 45.sp,
  );

  //Body
  static TextStyle bodyM = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    letterSpacing: 0.25.sp,
  );

  static TextStyle bodyMGrey = TextStyle(
    fontWeight: FontWeight.w400,
    height: 20.sp / 14.sp,
    fontSize: 14.sp,
    letterSpacing: 0.25.sp,
    color: grey30,
  );

  static TextStyle bodyS = TextStyle(
    fontWeight: FontWeight.w400,
    height: 16.sp / 12.sp,
    fontSize: 12.sp,
  );

  static TextStyle bodyXS = TextStyle(
    fontWeight: FontWeight.w400,
    height: 16.sp / 11.sp,
    fontSize: 11.sp,
  );

  static TextStyle bodySGrey = TextStyle(
    fontWeight: FontWeight.w400,
    height: 16.sp / 12.sp,
    fontSize: 12.sp,
    color: grey30,
    letterSpacing: 0.1,
  );

  static TextStyle errorBodyS = TextStyle(
    fontWeight: FontWeight.w400,
    height: 16.sp / 12.sp,
    fontSize: 12.sp,
    color: error,
  );

  static TextStyle bodySWithBackground = TextStyle(
    fontWeight: FontWeight.w400,
    height: 16.sp / 12.sp,
    fontSize: 12.sp,
    backgroundColor: cyan90,
  );

  static TextStyle bodyL = TextStyle(
    fontWeight: FontWeight.w400,
    height: 24.sp / 16.sp,
    fontSize: 16.sp,
    letterSpacing: 0.5.sp,
  );

  static TextStyle bodyXL = TextStyle(
    fontWeight: FontWeight.w600,
    height: 24.sp / 16.sp,
    fontSize: 16.sp,
    letterSpacing: 0.5.sp,
  );

  static TextStyle bodySWithBG = TextStyle(
    backgroundColor: cyan90,
    fontWeight: FontWeight.w400,
    height: 16.sp / 12.sp,
    fontSize: 12.sp,
    letterSpacing: 0.25.sp,
  );

  //Label
  static TextStyle labelXL = TextStyle(
    fontWeight: FontWeight.w600,
    height: 20.sp / 16.sp,
    fontSize: 16.sp,
    letterSpacing: 0.1.sp,
  );

  static TextStyle labelL = TextStyle(
    fontWeight: FontWeight.w600,
    height: 20.sp / 14.sp,
    fontSize: 14.sp,
    letterSpacing: 0.1.sp,
  );

  static TextStyle labelM3 = TextStyle(
    fontWeight: FontWeight.w500,
    height: 20.sp / 14.sp,
    fontSize: 14.sp,
    letterSpacing: 0.1.sp,
  );

  static TextStyle labelM = TextStyle(
    fontWeight: FontWeight.w600,
    height: 16.sp / 14.sp,
    fontSize: 12.sp,
    letterSpacing: 0.5.sp,
  );

  static TextStyle labelS = TextStyle(
    fontWeight: FontWeight.w600,
    height: 16.sp / 11.sp,
    fontSize: 11.sp,
    letterSpacing: 0.5.sp,
  );

  //Headlines
  static TextStyle headlineS = TextStyle(
    fontWeight: FontWeight.w600,
    height: 32.sp / 24.sp,
    fontSize: 24.sp,
  );

  static TextStyle headlineM = TextStyle(
    fontWeight: FontWeight.w600,
    height: 36.sp / 24.sp,
    fontSize: 20.sp,
  );

  static TextStyle headlineL = TextStyle(
    fontWeight: FontWeight.w400,
    height: 36.sp / 24.sp,
    fontSize: 18.sp,
  );

  // M3/label/medium
  static TextStyle m3label = TextStyle(
    fontWeight: FontWeight.w400,
    height: 16.sp / 12.sp,
    fontSize: 12.sp,
    color: cyan80,
    letterSpacing: 0.5.sp,
  );

  //ViewsCount
  static TextStyle labelViews = TextStyle(
    fontWeight: FontWeight.w700,
    height: 112.sp / 96.sp,
    fontSize: 96.sp,
  );

  static TextStyle labelTotalViews = TextStyle(
    fontWeight: FontWeight.w700,
    height: 30.sp / 27.sp,
    fontSize: 27.sp,
  );
}
