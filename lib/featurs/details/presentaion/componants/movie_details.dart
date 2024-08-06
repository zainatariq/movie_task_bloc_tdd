import 'package:bi/featurs/details/presentaion/componants/rate_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/AppColors.dart';
import '../../../../core/util/app_consts.dart';
import '../../../homeScreen/data/models/add_profile_model.dart';
import '../manager/detaills_cubit.dart';
import '../manager/detaills_state.dart';
import 'poster/bg_poster.dart';

Widget getMovieDetailsSection(Movie _movie,
    {required BuildContext context, double? userRating}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      getMoviePosterBackground(_movie),
      Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            K.sizedBoxH20,
            Text(
              _movie.title,
              style: TextStyle(
                color: AppColors.primaryAppColor,
                fontSize: 25.0.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            K.sizedBoxH20,
            Text(
              'Release date: ${_movie.releaseDate ?? ''}',
              // style: K.blackExtraSmallTextField,
            ),
            Text('Overview:',
                style: TextStyle(color: AppColors.primaryAppColor)),
            K.sizedBoxH20,
            Text(
              _movie.overview,
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline.withOpacity(1),
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20),
            Text('Rate the movie:',
                style: TextStyle(color: AppColors.primaryAppColor)),
            const SizedBox(height: 20),
            BlocBuilder<DetailsCubit, DetailsState>(
              builder: (context, state) {
                double rate = 0.0;

                if (state is DeleteState) {
                  rate = 0;
                }
                if (state is IsFavState) {
                  rate = 1;
                }

                return RatingWidget(
                  initialRating: rate,
                  onRatingChanged: (rating) {
                    double r = rating.toDouble();
                    context.read<DetailsCubit>().rateMovie(_movie.id.toString(),
                        rating: r, context: context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    ],
  );
}
