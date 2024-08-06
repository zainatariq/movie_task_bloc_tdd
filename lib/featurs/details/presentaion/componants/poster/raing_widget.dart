import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/app_consts.dart';
import '../../../../homeScreen/data/models/add_profile_model.dart';


Widget getRating( Movie _movie) {
  return Container(
    margin:EdgeInsets.all(20.sp),
    // height: 30.0.h,
    child: Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        // height: 40.0.h,
        decoration: K.boxDecorationPrimaryBg,
        padding: EdgeInsets.symmetric(
          horizontal: 20.0.w,
          vertical: 8.0.h,
        ),
        child: Text("RATING: ${_movie.voteAverage}  / 10",
            ),
      ),
    ),
  );
}