

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/AppColors.dart';
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool? isValid;
  final bool isEmpty;
  final bool? isSearch;
  final String hintText;
  final bool? isCountryCodeExists;
  final int? maxCharacters;
  final int? maxLength;
  final int? maxLines;
  final double? cursorHeight;
  final double? fontSize;
  final bool? cardNumber;
  final bool? isCentered;
  final bool? isError;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String)? onChanged;
  final void Function(String)? onCountryCodeChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String text)? onFieldSubmitted;
  final FocusNode? nextFocus;
  final Color? color;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.focusNode,
    required this.onChanged,
    required this.onCountryCodeChanged,
    this.isEmpty = true,
    this.isValid,
    this.isError,
    this.validator,
    this.isSearch,
    this.inputFormatters,
    this.suffixIcon,
    this.color,
    this.prefixIcon,
    this.fontSize,
    this.nextFocus,
    this.contentPadding,
    this.onFieldSubmitted,
    this.isCentered = false,
    this.keyboardType,
    this.cursorHeight,
    this.maxCharacters = 1,
    this.cardNumber,
    this.maxLines,
    this.maxLength,
    required this.hintText,
    this.isCountryCodeExists = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      validator: validator,
      maxLength: maxLength,
      maxLines: maxLines,
      focusNode: focusNode,
      cursorHeight: cursorHeight,
      cursorColor: color ?? Theme.of(context).colorScheme.onSurface,
      onChanged: onChanged,
      textAlign: isCentered == true ? TextAlign.center : TextAlign.start,
      textAlignVertical: isCentered == true ? TextAlignVertical.center : TextAlignVertical.top,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: fontSize,
      ),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        filled: true,
        fillColor: Theme.of(context).colorScheme.outlineVariant,
        border: borderStyle(context, isError: isError),
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        focusedBorder: borderStyle(context, isError: isError),
        hintStyle: TextStyle(
          fontSize: fontSize ?? 12.sp,
          color: color ?? Theme.of(context).colorScheme.onSurface,
        ),
        enabledBorder: borderStyle(context, isError: isError),
        contentPadding: contentPadding ??
            EdgeInsets.only(
              left: (isCountryCodeExists ?? false) ? 20.0 : 16.0,
              right: 12.0,
              top: 18.0,
              bottom: 18.0,
            ),
        disabledBorder: borderStyle(context, isError: isError),
        errorBorder: borderStyle(context, isError: isError),
        prefixIcon: isCountryCodeExists!
            ? Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            width: 100,
            padding: const EdgeInsetsDirectional.only(start: 18.0),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/svg_icons/uae_flag.svg'),
                SizedBox(width: 10.w),
                Text(
                  '+971',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        )
            : prefixIcon ??
            (isSearch == true
                ? const Icon(Icons.search, size: 30, color: Colors.grey)
                : null),
        suffixIcon: suffixIcon ??
            (isEmpty
                ? null
                : (isValid!
                ? Padding(
              padding: EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/images/svg_icons/valid.svg',
                color: AppColors.green,
              ),
            )
                : const Icon(Icons.highlight_remove, color: Colors.red))),
      ),
      keyboardType: keyboardType ?? TextInputType.phone,
      // onFieldSubmitted: (text) {
      //   if (nextFocus != null) {
      //     FocusScope.of(context).requestFocus(nextFocus);
      //   }
      //   onFieldSubmitted?.call(text);
      // },
    );
  }

  OutlineInputBorder borderStyle(context, {bool? isError}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: isError == true
            ? Colors.red
            : isError == false
            ? AppColors.greenColor
            : Theme.of(context).colorScheme.surface,
        width: 1.0,
      ),
    );
  }
}
