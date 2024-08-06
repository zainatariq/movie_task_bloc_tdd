





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/AppColors.dart';
import '../../../../../generated/assets.dart';
import 'custom_text_field.dart';

Widget searchWidget({
  required TextEditingController searchController,
  required FocusNode searchFocusNode,
  required hint,
  required void Function(String)? onChanged,
  required void Function(String)? onSubmit,
  void Function()? getCurrent,
}) {
  return SizedBox(
    height: 55.h,
    child: CustomTextFormField(
      controller: searchController,
      focusNode: searchFocusNode,
      keyboardType: TextInputType.text,
      isCountryCodeExists: false,
      isSearch: true,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      contentPadding: const EdgeInsets.only(
        left: 20.0,
        top: 20.0,
      ),
      // cursorHeight: 20.h,
      hintText: hint,
      onCountryCodeChanged: (String code) {},
      prefixIcon: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Image.asset(
          Assets.iconsSearch,
          width: 10.w,
          height: 10.h,
          fit: BoxFit.contain,
        ),
      ),
      suffixIcon: getCurrent == null
          ? null
          : GestureDetector(
          onTap: getCurrent,
          child: Icon(
            Icons.my_location_rounded,
            size: 20.sp,
            color: AppColors.primaryAppColor,
          )),
    ),
  );
}
