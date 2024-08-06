

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/app_consts.dart';
import '../../../../generated/assets.dart';
import '../../../../helper/nav.dart';
import '../../../homeScreen/data/models/add_profile_model.dart';
import '../../../homeScreen/presentaion/pages/widgets/custom_movie_cars.dart';

class AllMoviesScreen extends StatelessWidget {
  List list = <Movie>[];

  AllMoviesScreen({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:   IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of( context!). textTheme.bodySmall?.color,
            size: 25.sp,
          ),
          onPressed: () {
            NavigationHelper.navigatePop(context);
          },
        ),
        title: Text(
          'All Movies',
          style: K.blackCardBoldTextStyle,

        ),
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 80.h),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesBg),
                fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 3.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: .6,
            ),
            padding: EdgeInsets.all(10.0),
            itemCount: 10,
            itemBuilder: (context, index) {
              return CustomMovieCard(movie: list[index]);
            },
          ),
        ),
      ),
    );
  }
}
