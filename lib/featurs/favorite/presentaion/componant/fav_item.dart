



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/AppColors.dart';
import '../../../../core/util/app_consts.dart';
import '../../../../helper/nav.dart';
import '../../../../route/paths.dart';
import '../../../../widgeta/custom_card.dart';
import '../../../homeScreen/data/models/add_profile_model.dart';

class FavItem extends StatelessWidget {
  final Movie movie ;
  const FavItem({
    super.key,
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 300.w,
        height: 180.h,
        child: Card(
          elevation: 10,
          color:  AppColors.blackColor.withOpacity(0.5),
          child: Stack(
            children: [
              Positioned.fill(
                child:  CustomCard(
                  image: movie.posterUrl,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x00000000),
                      AppColors.blackColor,
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:10.h,right: 10.h,left: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [


                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        K.sizedBoxW10,
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.8.w,
                          child: Text(
                            movie.title,
                            style: K.blackCardBoldTextStyle,
                          ),
                        ),
                      ],
                    ),
                    K.sizedBoxH20,

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        NavigationHelper.navigateTo(context, AppPaths. detailsScreen,
            arguments: movie.toMap());
      },
    );
  }
}
