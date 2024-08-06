
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/app_consts.dart';
import '../../../../homeScreen/data/models/add_profile_model.dart';


Widget getMoviePoster(BuildContext context, Movie _movie) {
  return Container(
    margin: EdgeInsets.all(10.sp),
    // decoration: K.whiteBoxDecorationWithBorder(contextt: context),
    decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.white38,
            blurRadius: 20.0,
            offset: Offset(0.0, 4.0),
            spreadRadius: 5.0,
          ),
        ],
        border: Border.all(
          color: Colors.white,
          width: 4.0,
        )),
    width: 120.0.w,
    height: 180.0.h,
    child: GestureDetector(
      child: Image.network(
        _movie.posterUrl,
        fit: BoxFit.cover,
      ),
      onTap: () {
        showImageViewer(context, Image.network(_movie.posterUrl).image,
            swipeDismissible: true, doubleTapZoomable: true);
      },
    ),
  );
}