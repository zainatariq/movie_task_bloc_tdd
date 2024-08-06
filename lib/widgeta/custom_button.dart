
import 'package:bi/core/util/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/AppColors.dart';

class CustomButton extends StatelessWidget {
  final bool? isValid;
  final bool? isBorder;
  final bool? isLoading;
  final String text;
  final TextStyle ?style;
  final VoidCallback? onPressed;
  final Color? bg;
  final Color? borderColors;

  const CustomButton({
    Key? key,
    this.isValid,
    this.bg,
    this.borderColors,
    this.isBorder,
     this.isLoading,
    required this.text,
      this.style,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading == true,
      child: Opacity(
        opacity: isValid! ? 1.0 : 0.5,
        child: isLoading == true
            ? Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(7.0)),
          // Use ScreenUtil here
          child: CircularProgressIndicator.adaptive( backgroundColor: AppColors.primaryColorDark,),
        )
            : Container(
          width: double.infinity,
          height: context.height * .065,
          decoration: BoxDecoration(
            color: bg ??
                (isValid!
                    ?
                // AppColors.green
                //
                Theme.of( context).colorScheme.tertiaryContainer

                // Theme.of( context).primaryColor
                //
                //     AppColors.validButtonColorDark
                //     :
                // AppColors.validButtonColorDark.withOpacity(.8)),
                :
                Theme.of( context).colorScheme.onTertiary
                ),
            borderRadius: BorderRadius.circular(16),
            border: (isBorder == true)
                ? Border.all(
               color: borderColors??
                   Colors.black.withOpacity(.5), // Border color
              width: 1.0, // Border width
            )
                : null,
          ),
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: style??TextStyle(color:
              Theme.of( context).colorScheme.secondary,
                fontSize:16.sp
              ),
            ),
          ),
        ),
      ),
    );
  }
}
