import 'package:vocabulary_day_by_day/common/theme/app_colors.dart';
import 'package:vocabulary_day_by_day/common/theme/app_texts.dart';
import 'package:flutter/material.dart';

//

class RoundedButton extends StatelessWidget {
  final Widget? icon;
  final Widget? suffixIcon;
  final String? labelText;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color? disableBackgroundColor;
  final Color disableBorder;
  final Color? disableTextColor;
  final Color textColor;
  final Color? borderColor;
  final bool isBorder;
  final bool disabled;
  final bool isSecondaryButton;
  final EdgeInsets margin;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final double fontSize;
  final double radius;
  final Widget? child;
  final AlignmentGeometry? alignment;
  final bool autoResizeHeight;

  const RoundedButton({
    Key? key,
    this.labelText,
    this.icon,
    this.child,
    this.width,
    this.height = 44,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.margin = const EdgeInsets.all(0),
    this.backgroundColor = ColorStyles.kPrimaryColor,
    this.disableBackgroundColor,
    this.disableBorder = ColorStyles.black2,
    this.borderColor,
    this.textColor = Colors.white,
    this.disabled = false,
    this.isSecondaryButton = false,
    this.onPressed,
    this.textStyle,
    this.alignment,
    this.radius = 6,
    this.isBorder = false,
    this.autoResizeHeight = false,
    this.fontSize = 16,
    this.disableTextColor,
    this.suffixIcon,
  })  : assert(child != null || labelText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: autoResizeHeight ? null : height,
      margin: margin,
      alignment: alignment,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          disabledBackgroundColor:
              disableBackgroundColor ?? ColorStyles.black05,
          disabledForegroundColor: Colors.transparent,
          foregroundColor: ColorStyles.black5,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          backgroundColor: disabled
              ? disableBackgroundColor ?? ColorStyles.black05
              : isSecondaryButton
                  ? ColorStyles.blue2
                  : backgroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: isBorder || disabled
                  ? BorderSide(
                      color: disabled
                          ? disableBorder
                          : borderColor ?? ColorStyles.black3,
                    )
                  : BorderSide.none),
        ),
        onPressed: disabled ? null : onPressed,
        onLongPress: disabled ? null : () {},
        child: child ??
            FittedBox(
              child: Row(
                children: [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: icon,
                    ),
                  Text(
                    labelText!,
                    style: textStyle ??
                        TextStyles.mobileButton.copyWith(
                          fontSize: fontSize,
                          color: disabled
                              ? disableTextColor ?? ColorStyles.black5
                              : isSecondaryButton
                                  ? ColorStyles.blue7
                                  : textColor,
                        ),
                  ),
                  if (suffixIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: suffixIcon,
                    ),
                ],
              ),
            ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
    this.disabled = false,
    this.onPressed,
  }) : super(key: key);

  final bool disabled;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RoundedButton(
        radius: 8,
        height: 36,
        width: 36,
        disabled: disabled,
        isBorder: disabled,
        padding: EdgeInsets.zero,
        child: Icon(
          Icons.check,
          color: !disabled ? ColorStyles.white : ColorStyles.black5,
        ),
        onPressed: () {
          onPressed?.call();
        },
      ),
    );
  }
}

class SaveButtonWithTitle extends StatelessWidget {
  const SaveButtonWithTitle({
    Key? key,
    this.disabled = false,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  final bool disabled;
  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      radius: 8,
      height: 36,
      disabled: disabled,
      isBorder: disabled,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(
            Icons.check,
            color: !disabled ? ColorStyles.white : ColorStyles.black5,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyles.mobileSmall.copyWith(color: ColorStyles.white),
          ),
        ],
      ),
      onPressed: () {
        onPressed?.call();
      },
    );
  }
}

