import 'package:vocabulary_day_by_day/common/theme/app_colors.dart';
import 'package:vocabulary_day_by_day/common/theme/app_texts.dart';
import 'package:vocabulary_day_by_day/common/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInput extends StatefulWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? labelText;
  final String? labelInput;
  final void Function(String)? onChanged;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final double radius;
  final double iconSize;
  final String? initValue;
  final bool readOnly;
  final bool enabled;
  final Widget? iconPrefix;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final bool obscureText;
  final bool autoFocus;
  final bool isBorder;
  final bool isUnderline;
  final bool showClearIcon;
  final Function()? onSuffixTap;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Color? fillColor;
  final FocusNode? focusNode;
  final EdgeInsets? scrollPadding;
  final EdgeInsets? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool isCustomErrorMessage;
  final bool autoValidate;
  final bool hasKeyboardAction;
  final bool isShowCountText;
  final Iterable<String>? autofillHints;

  // this field is use for custom validation,
  // if you want to show this text field is error in some specific case
  // like you want to auto validate the field is not empty but validate the
  // field is email when user tap button to validate, use this field to make the border error color
  final bool isCustomError;
  final TextAlign textAlign;
  final AutovalidateMode? autovalidateMode;
  final Color focusedBorderColor;
  final Color disabledBorderColor;
  final Color enabledBorderColor;
  final MainAxisAlignment? mainAxisAlignment;
  final bool isShowRequiredIcon;
  final ScrollController? scrollController;

  const AppInput({
    Key? key,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.onChanged,
    this.minLines = 1,
    this.maxLength,
    this.maxLines = 1,
    this.radius = 6,
    this.iconSize = 20,
    this.iconPrefix,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.contentPadding,
    this.scrollPadding,
    this.inputFormatters,
    this.style,
    this.labelText,
    this.initValue,
    this.fillColor,
    this.focusNode,
    this.onTap,
    this.hintStyle,
    this.labelInput,
    this.textCapitalization = TextCapitalization.sentences,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onSuffixTap,
    this.obscureText = false,
    this.isBorder = true,
    this.autoFocus = false,
    this.isUnderline = false,
    this.showClearIcon = false,
    this.enabled = true,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.isCustomErrorMessage = false,
    this.autoValidate = false,
    this.isCustomError = false,
    this.hasKeyboardAction = false,
    this.textAlign = TextAlign.start,
    Color? focusedBorderColor,
    Color? disabledBorderColor,
    Color? enabledBorderColor,
    this.mainAxisAlignment,
    this.isShowCountText = true,
    this.isShowRequiredIcon = false,
    this.scrollController,
    this.autofillHints,
  })  : focusedBorderColor = focusedBorderColor ?? ColorStyles.blue7,
        enabledBorderColor = enabledBorderColor ?? ColorStyles.black2,
        disabledBorderColor = disabledBorderColor ?? ColorStyles.black2,
        super(key: key);

  @override
  _AppInputState createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  final double _defaultContentPadding = 12;

  @override
  Widget build(BuildContext context) {
    bool showClearIcon =
        widget.controller != null ? widget.controller!.text.isNotEmpty : false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        if (widget.labelInput != null)
          AppInputLabel(
            label: widget.labelInput!,
            isRequired: widget.isShowRequiredIcon,
          ),
        TextFormField(
          autofillHints: widget.autofillHints,
          scrollController: widget.scrollController,
          maxLength: widget.maxLength,
          scrollPadding: widget.scrollPadding ??
              EdgeInsets.all(widget.hasKeyboardAction ? 70 : 20),
          textAlign: widget.textAlign,
          textCapitalization: widget.textCapitalization,
          cursorColor: ColorStyles.black10,
          autovalidateMode: widget.autoValidate
              ? AutovalidateMode.always
              : widget.autovalidateMode,
          enabled: widget.enabled,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          style: widget.style ??
              TextStyles.mobileBody.copyWith(color: ColorStyles.black10),
          autofocus: widget.autoFocus,
          controller: widget.controller,
          onChanged: (text) {
            widget.onChanged?.call(text.trim());
            setState(() {
              showClearIcon = text.isNotEmpty;
            });
          },
          initialValue: widget.initValue,
          onFieldSubmitted: (String text) {
            widget.onFieldSubmitted?.call(text.trim());
          },
          readOnly: widget.readOnly,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          obscureText: widget.obscureText,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            counterText: widget.isShowCountText ? null : '',
            errorStyle: widget.isCustomErrorMessage
                ? const TextStyle(height: 0)
                : TextStyles.mobileCaption1.copyWith(color: kErrorColor),
            errorMaxLines: 3,
            isDense: true,
            labelText: widget.labelText,
            filled: true,
            fillColor: !widget.enabled
                ? widget.fillColor ?? ColorStyles.black1
                : widget.fillColor ?? Colors.transparent,
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                  right: widget.contentPadding?.left ?? _defaultContentPadding),
              child: widget.iconPrefix,
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(
                  right:
                      widget.contentPadding?.right ?? _defaultContentPadding),
              child: widget.suffixIcon ??
                  (widget.showClearIcon && showClearIcon
                      ? IconButton(
                          onPressed: () {
                            widget.controller!.text = '';
                            setState(() => showClearIcon = false);
                          },
                          icon: const Icon(
                            CupertinoIcons.clear_circled_solid,
                            size: 18,
                            color: ColorStyles.black5,
                          ),
                        )
                      : const SizedBox.shrink()),
            ),
            suffixIconConstraints: widget.suffixIconConstraints ??
                const BoxConstraints(maxHeight: 42),
            prefixIconConstraints: widget.prefixIconConstraints ??
                const BoxConstraints(maxHeight: 42),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ??
                TextStyles.mobileBody.copyWith(color: ColorStyles.black5),
            contentPadding: EdgeInsets.only(
              top: widget.contentPadding?.top ?? _defaultContentPadding,
              bottom: widget.contentPadding?.bottom ?? _defaultContentPadding,
            ),
            errorBorder: _getInputBorder(
              kBorderErrorColor,
              shadowColor: kShadowErrorColor,
            ),
            focusedErrorBorder: widget.readOnly
                ? _getInputBorderNotShadow(kBorderErrorColor)
                : _getInputBorder(kBorderErrorColor,
                    shadowColor: kShadowErrorColor),
            enabledBorder: widget.readOnly
                ? widget.isCustomError
                    ? _getInputBorderNotShadow(kBorderErrorColor)
                    : _getInputBorderNotShadow(widget.enabledBorderColor)
                : widget.isCustomError
                    ? _getInputBorder(kBorderErrorColor)
                    : _getInputBorder(widget.enabledBorderColor),
            focusedBorder: widget.readOnly
                ? widget.isCustomError
                    ? _getInputBorderNotShadow(kBorderErrorColor)
                    : _getInputBorderNotShadow(
                        widget.focusedBorderColor,
                      )
                : widget.isCustomError
                    ? _getInputBorder(
                        kBorderErrorColor,
                        shadowColor: kShadowErrorColor,
                      )
                    : _getInputBorder(
                        widget.focusedBorderColor,
                        shadowColor: kShadowFocusColor,
                      ),
            disabledBorder: widget.readOnly
                ? _getInputBorderNotShadow(widget.disabledBorderColor)
                : _getInputBorder(widget.disabledBorderColor),
          ),
        ),
      ],
    );
  }

  InputBorder _getInputBorder(Color color,
      {Color shadowColor = Colors.transparent}) {
    return widget.isBorder
        ? widget.isUnderline
            ? UnderlineInputBorder(borderSide: BorderSide(color: color))
            : DecoratedInputBorder(
                child: _outlineInputBorder(color: color),
                shadow: BoxShadow(
                  color: shadowColor,
                  spreadRadius: 3,
                ),
              )
        : widget.fillColor != null
            ? _outlineInputBorder()
            : InputBorder.none;
  }

  InputBorder _getInputBorderNotShadow(Color color) {
    return widget.isBorder
        ? widget.isUnderline
            ? UnderlineInputBorder(borderSide: BorderSide(color: color))
            : _outlineInputBorder(color: color)
        : widget.fillColor != null
            ? _outlineInputBorder()
            : InputBorder.none;
  }

  InputBorder _outlineInputBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius),
      borderSide: color != null
          ? BorderSide(
              color: color,
            )
          : BorderSide.none,
    );
  }
}

class DecoratedInputBorder extends InputBorder {
  DecoratedInputBorder({
    required this.child,
    required this.shadow,
  }) : super(borderSide: child.borderSide);

  final InputBorder child;

  final BoxShadow shadow;

  @override
  bool get isOutline => child.isOutline;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      child.getInnerPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      child.getOuterPath(rect, textDirection: textDirection);

  @override
  EdgeInsetsGeometry get dimensions => child.dimensions;

  @override
  InputBorder copyWith(
      {BorderSide? borderSide,
      InputBorder? child,
      BoxShadow? shadow,
      bool? isOutline}) {
    return DecoratedInputBorder(
      child: (child ?? this.child).copyWith(borderSide: borderSide),
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  ShapeBorder scale(double t) {
    final scalledChild = child.scale(t);

    return DecoratedInputBorder(
      child: scalledChild is InputBorder ? scalledChild : child,
      shadow: BoxShadow.lerp(null, shadow, t)!,
    );
  }

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection? textDirection}) {
    final clipPath = Path()
      ..addRect(const Rect.fromLTWH(-5000, -5000, 10000, 10000))
      ..addPath(getInnerPath(rect), Offset.zero)
      ..fillType = PathFillType.evenOdd;
    canvas.clipPath(clipPath);

    final Paint paint = shadow.toPaint();
    final Rect bounds = rect.shift(shadow.offset).inflate(shadow.spreadRadius);

    canvas.drawPath(getOuterPath(bounds), paint);

    child.paint(canvas, rect,
        gapStart: gapStart,
        gapExtent: gapExtent,
        gapPercentage: gapPercentage,
        textDirection: textDirection);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is DecoratedInputBorder &&
        other.borderSide == borderSide &&
        other.child == child &&
        other.shadow == shadow;
  }

  @override
  int get hashCode => Object.hash(borderSide, child, shadow);
}

class AppInputLabel extends StatelessWidget {
  final String label;
  final bool isRequired;
  final EdgeInsetsGeometry padding;

  const AppInputLabel({
    super.key,
    required this.label,
    this.padding = const EdgeInsets.only(
      bottom: 8,
    ),
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: RichText(
        text: TextSpan(
          style: TextStyles.mediumBody2.copyWith(
            color: ColorStyles.black7,
          ),
          children: [
            TextSpan(
              text: label,
            ),
            if (isRequired)
              TextSpan(
                text: " *",
                style: TextStyles.mediumBody2.copyWith(
                  color: kErrorColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
