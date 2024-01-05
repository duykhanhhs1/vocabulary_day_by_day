import 'package:vocabulary_day_by_day/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF2C56EA);
const kContentColorDarkTheme = Color(0xFFF5FCF9);

const kErrorColor = ColorStyles.red7;
const kBorderErrorColor = ColorStyles.red6;
const kShadowErrorColor = Color(0xFFFFDDD8);
const kShadowFocusColor = Color(0xFFC3DBFF);

const kPrimaryGreyColor = Color.fromRGBO(105, 109, 119, 1);
const kPrimaryBlackColor = Color(0xff424242);
const kHintTextColor = Color(0xff68738C);
const kWhiteColor = Color(0xffFFFFFF);

const EdgeInsets kHorizontalPadding =
    EdgeInsets.symmetric(horizontal: kHorizontalPixel);
const kHorizontalPixel = 20.0;

const kHorizontalContentPadding = 15.0;

const kRadius = 8.0;

//Duration animation
const int durationMilliseconds = 300;
const Duration animatedDuration = Duration(milliseconds: 100);
const Duration kSnackBarDuration = Duration(seconds: 2);

//Following GetX
const Duration durationBottomSheet = Duration(milliseconds: 250);
const Duration kDurationController = Duration(milliseconds: 250);

//App Bar Action Icon Button Spacing
const double kAppBarPadding = 12.0;
const double kAppBarActionSpacing = 12;
const kAppBarActionButtonSpacing = EdgeInsets.only(right: kAppBarActionSpacing);

//Shadow
const kCardBoxShadow = BoxShadow(
  color: Color.fromRGBO(2, 35, 96, .04),
  blurRadius: 12,
  offset: Offset(0, 6),
);
