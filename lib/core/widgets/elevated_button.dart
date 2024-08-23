import 'package:flutter/material.dart';
import 'package:flutter_application_practice/core/theme/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double borderRadius;
  final double elevation;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final Size? minimumSize;
  final Size? maximumSize;
  final Size? fixedSize;

  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.borderRadius = 8.0,
    this.elevation = 0.0,
    this.padding,
    this.textStyle,
    this.minimumSize,
    this.maximumSize,
    this.fixedSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.blueColor,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: elevation,
        padding: padding,
        minimumSize: minimumSize,
        maximumSize: maximumSize,
        fixedSize: fixedSize,
      ),
      child: Text(
        label,
        style: textStyle,
      ),
    );
  }
}
