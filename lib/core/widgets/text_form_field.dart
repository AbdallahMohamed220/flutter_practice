import 'package:flutter/material.dart';
import 'package:flutter_application_practice/core/theme/colors.dart';
import 'package:flutter_application_practice/core/theme/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry contentPadding;
  final String? labelText;
  final String? hintText;
  final TextStyle? hintStyle;
  final IconData? prefixIcon;
  final VoidCallback? onPrefixIconTap;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final bool obscureText;
  final Color? filledColor;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;

  const CustomTextFormField({
    super.key,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 18,
    ),
    this.labelText,
    this.filledColor = AppColors.lightestGrey,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.onPrefixIconTap,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      style: TextStyles.lightGreyMedium14.copyWith(
        color: AppColors.lightBlack,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: filledColor,
        isDense: true,
        contentPadding: contentPadding,
        labelText: labelText,
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.lightGreyMedium14,
        prefixIcon: prefixIcon != null
            ? GestureDetector(
                onTap: onPrefixIconTap,
                child: Icon(
                  prefixIcon,
                  color: AppColors.grey,
                ),
              )
            : null,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixIconTap,
                child: Icon(
                  suffixIcon,
                  color: AppColors.lightGrey,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.lighterGrey,
            width: 1.3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.lighterGrey,
            width: 1.3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.blue,
            width: 1.3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.red,
            width: 1.3,
          ),
        ),
      ),
    );
  }
}
