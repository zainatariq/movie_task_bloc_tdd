
import 'dart:ui';
import 'package:bi/common/AppColors.dart';
import 'package:bi/featurs/homeScreen/presentaion/pages/widgets/custom_movie_cars.dart';
import 'package:bi/generated/locale_keys.g.dart';
import 'package:bi/localization/change_language.dart';
import 'package:bi/route/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/app_consts.dart';
import '../../../../generated/assets.dart';
import '../../../../helper/nav.dart';
import '../../../../route/paths.dart';
import '../../../../widgeta/custom_carousel.dart';
import '../manager/home_screen_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesBg),
              fit: BoxFit.cover
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 3.0),
          child: Padding(
            padding:EdgeInsets.all(10.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 80.h,),
                  Center(
                    child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
                      builder: (context, state) {
                        if (state is GetMoviesDataLoading) {
                          return CircularProgressIndicator(
                            color: AppColors.primaryAppColor,
                          );
                        } else if (state is GetMoviesDataSuccess) {
                          return CustomCarousel(
                            list: state.movieResponse,
                            isLoading: false,
                          );
                        } else if (state is GetMoviesDataError) {
                          return Text(state.message, style: K.yellowCardTextStyle);
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  K.sizedBoxH20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.new_releases.tre,
                        style: K.blackCardTextStyle,
                      ),
                      GestureDetector(
                        child: Text(
                         LocaleKeys.see_more.tre,
                          style: K.blackCardBoldTextStyle,
                        ),
                        onTap: () {
                          final cubit = context.read<HomeScreenCubit>();
                          NavigationHelper.navigateTo(context, AppPaths.allMoviesScreen,
                              arguments: cubit.res);
                        },
                      ),
                    ],
                  ),
                  K.sizedBoxH20,
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.h,
                    child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
                      builder: (context, state) {
                        if (state is GetMoviesDataSuccess) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.movieResponse.length < 8
                                ? state.movieResponse.length
                                : 8,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final movie = state.movieResponse[index];
                              return CustomMovieCard(movie: movie);
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}
