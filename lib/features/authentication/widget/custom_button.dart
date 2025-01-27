// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'sized_x.dart';

/// this class is the custom button
class CustomButton extends StatelessWidget {
  /// constructor
  const CustomButton({
    required this.onPressed,
    required this.buttonText,
    this.isFilled = true,
    this.hasBorder = true,
    super.key,
    this.fillBackgroundColor,
    this.forceNotFillOnPressed = false,
    this.enabled = true,
    this.fillTextColor,
    this.notFillTextColor,
    this.notFillBackgroundColor,
    this.borderColor,
    this.icon,
    this.buttonSize,
    this.labelText,
    this.borderRadius,
  });
  final VoidCallback onPressed;
  final String buttonText;
  final bool isFilled;
  final bool? forceNotFillOnPressed;
  final Color? fillBackgroundColor;
  final Color? notFillBackgroundColor;
  final Color? fillTextColor;
  final Color? notFillTextColor;
  final Color? borderColor;
  final bool hasBorder;
  final bool enabled;
  final Widget? icon;
  final Size? buttonSize;
  final TextStyle? labelText;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Padding(
        padding: icon != null
            ? EdgeInsets.symmetric(horizontal: 2.w)
            : EdgeInsets.zero,
        child: icon ?? SizedX.zero,
      ),
      onPressed: enabled
          ? isFilled
              ? onPressed
              : forceNotFillOnPressed!
                  ? onPressed
                  : null
          : null,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all<Size>(
          buttonSize ?? Size(double.infinity, 5.9.h),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          enabled
              ? isFilled
                  ? fillBackgroundColor ?? Theme.of(context).primaryColor
                  : notFillBackgroundColor ??
                      Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).disabledColor,
        ),
        elevation: enabled
            ? isFilled
                ? WidgetStateProperty.resolveWith<double>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        return 10;
                      }
                      return 5;
                    },
                  )
                : null
            : null,
        enableFeedback: true,
        shadowColor: WidgetStateProperty.all<Color>(Colors.black45),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.sp),
            side: BorderSide(
              color: hasBorder
                  ? borderColor ??
                      (isFilled
                          ? fillBackgroundColor ?? Colors.transparent
                          : notFillBackgroundColor ??
                              Theme.of(context).dividerColor)
                  : Colors.transparent,
            ),
          ),
        ),
        // This is the part where we add the shadow to the button
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return fillBackgroundColor?.withOpacity(0.5) ??
                  Colors.grey.withOpacity(0.5);
            }
            return Colors.transparent;
          },
        ),
      ),
      label: FittedBox(
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: labelText ??
              Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    color: enabled
                        ? isFilled
                            ? fillTextColor ?? Theme.of(context).dividerColor
                            : notFillTextColor ?? Theme.of(context).dividerColor
                        : Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.6),
                  ),
        ),
      ),
    );
  }
}
