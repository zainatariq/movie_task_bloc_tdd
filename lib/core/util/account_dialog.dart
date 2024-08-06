
import 'package:bi/localization/change_language.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/AppColors.dart';
import '../../generated/assets.dart';
import '../../generated/locale_keys.g.dart';
 import '../../widgeta/contex.dart';
import '../../widgeta/custom_button.dart';
import 'app_consts.dart';

class AccountDialog {
  static Future<void> showAccountDialog({
    // required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onPressed,
  }) async {
    BuildContext? context = ConText.navigatorKey.currentState?.overlay?.context;

    return showDialog(
      context: context!,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          // title:
          //     Image.asset(Assets.s, width: 100.w, height: 100.h),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(title, style: K.blackMeduimBoldTextStyle(contextt: context)),
              K.sizedBoxH10,
              Text(message, textAlign: TextAlign.center),
            ],
          ),
          actions: <Widget>[
            CustomButton(
                onPressed: onPressed,
                isValid: true,
                text: 'done'.tr(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    // color: AppColors.primaryColorDark,
                    fontWeight: FontWeight.w500,
                    fontSize: 25
                        .sp) // style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                ),
          ],
        );
      },
    );
  }

  static Future<void> showDeleteDialog({
    required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onPressed,
  }) async {
    // BuildContext? context = ConText.navigatorKey.currentState?.overlay?.context;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          // title: Image.asset(Assets.pngIconsSuccess, width: 100.w, height: 100.h),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              K.sizedBoxH20,
              Text(
                title,
                style: K.blackMeduimBoldTextStyle(contextt: context),
                textAlign: TextAlign.center,
              ),
              K.sizedBoxH10,
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp),
              ),
            ],
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 49.h,
                    // padding:   EdgeInsets.symmetric(vertical: 5.0.h),
                    child: CustomButton(
                      onPressed: () {
                        // cubit.showUpdatePicSheet();
                        Navigator.of(context).pop();
                      },
                      bg: Colors.transparent,
                      isValid: true,
                      isBorder: true,
                      text: LocaleKeys.cancel.tre,
                      // style: TextStyle(color: Colors.black.withOpacity(.6)))
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                          // color: AppColors.blackColor,
                          fontSize: 16.sp),
                    ),
                  ),
                ),
                K.sizedBoxW20,
                Expanded(
                  child: SizedBox(
                    height: 52.h,
                    // padding:   EdgeInsets.symmetric(vertical: 5.0.h),
                    child: CustomButton(
                      // onPressed: cubit.onValidate,
                      onPressed: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => AddYourCardScreen(),
                        //       ));
                      },
                      isValid: true,
                      bg: AppColors.navyRedColor,
                      text: LocaleKeys.delete.tre,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  static Future<void> logoutDialog(
      {required BuildContext context,
      required String title,
      required String message,
      required VoidCallback onPressed,
      required bool isLoading}) async {
    // BuildContext? context = ConText.navigatorKey.currentState?.overlay?.context;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:Theme.of(context).scaffoldBackgroundColor,
           content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              K.sizedBoxH20,
              Text(
                title,
                style: K.blackMeduimBoldTextStyle(contextt: context),
                textAlign: TextAlign.center,
              ),
              K.sizedBoxH10,
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp),
              ),
            ],
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 49.h,
                     child: CustomButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      bg: Colors.transparent,
                      isValid: true,
                      isBorder: true,
                      text: LocaleKeys.cancel.tre,
                      borderColors:AppColors.primaryAppColor,
                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp),
                    ),
                  ),
                ),
                K.sizedBoxW20,
                Expanded(
                  child: SizedBox(
                    height: 52.h,
                    child: CustomButton(
                      isLoading: isLoading,
                      onPressed: onPressed,
                      isValid: true,
                      bg: AppColors.navyRedColor,
                      text: LocaleKeys.logout.tre,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

// class ConText {
//   static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//   BuildContext? context = ConText.navigatorKey.currentState?.overlay?.context;
// }
