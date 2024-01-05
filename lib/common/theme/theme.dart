import 'package:vocabulary_day_by_day/common/theme/app_colors.dart';
import 'package:vocabulary_day_by_day/common/theme/app_texts.dart';
import 'package:vocabulary_day_by_day/common/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: const ColorScheme.light(
      primary: ColorStyles.black10,
      secondary: ColorStyles.blue2,
      error: ColorStyles.red4,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorStyles.blue7,
      selectionColor: ColorStyles.blue2,
      selectionHandleColor: ColorStyles.blue7,
    ),
    canvasColor: Colors.transparent,
    focusColor: Colors.transparent,
    iconTheme: const IconThemeData(color: ColorStyles.white, size: 20),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: const IconThemeData(color: ColorStyles.black7, size: 20),
      backgroundColor: Colors.transparent,
      centerTitle: false,
      elevation: 0,
      actionsIconTheme:
          const IconThemeData(color: ColorStyles.black7, size: 20),
      shadowColor: ColorStyles.black2.withOpacity(.3),
      titleTextStyle:
          TextStyles.mobileSubtitle1.copyWith(color: ColorStyles.black10),
    ),
    textTheme: GoogleFonts.interTextTheme(
      Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
            decorationColor: Colors.white,
          ),
    ),
  );
}
