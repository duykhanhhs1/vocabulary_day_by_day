import 'dart:ui';

import 'package:vocabulary_day_by_day/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key? key,
    required this.child,
    this.width,
    this.color,
    this.borderColor,
    this.height,
    this.onTap,
    this.margin,
    this.hasSplashColor = false,
    this.radius = 15,
    this.borderWidth = 1,
    this.alignment,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.boxShadow = const [],
    this.blurBg = true,
  }) : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final Color? borderColor;
  final bool hasSplashColor;
  final bool blurBg;
  final double borderWidth;
  final double radius;
  final Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: hasSplashColor ? null : Colors.transparent,
      highlightColor: hasSplashColor ? null : Colors.transparent,
      borderRadius: BorderRadius.circular(radius),
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: margin,
          alignment: alignment,
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: color ?? ColorStyles.white.withOpacity(.1),
            borderRadius: BorderRadius.circular(radius),
            boxShadow: boxShadow,
          ),
          child: blurBg
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: child,
                )
              : child,
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key? key,
    required this.child,
    this.size = 32,
    this.color,
    this.borderColor,
    this.onTap,
    this.margin,
    this.radius = 6,
    this.alignment,
    this.padding,
    this.boxShadow = const [],
  }) : super(key: key);

  final Widget child;
  final double? size;
  final Color? color;
  final Color? borderColor;
  final double radius;
  final Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTap,
        child: Container(
          margin: margin,
          alignment: alignment ?? Alignment.center,
          width: size,
          height: size,
          padding: padding,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: borderColor ?? ColorStyles.black3,
            ),
            boxShadow: boxShadow,
          ),
          child: child,
        ),
      ),
    );
  }
}
