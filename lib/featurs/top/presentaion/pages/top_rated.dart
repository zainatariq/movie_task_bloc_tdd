import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/AppColors.dart';
import '../../../../core/util/app_consts.dart';
import '../../../../generated/assets.dart';
import '../../../../injection_contanier.dart';
import '../../../favorite/presentaion/componant/list_items.dart';
import '../manager/top_rated_cubit.dart';


class TopRatedScreen extends StatelessWidget {
  const TopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
        padding: EdgeInsets.all(10.sp),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBg),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 3.0),
          child: BlocProvider<TopRatedCubit>(
            create: (context) => sl<TopRatedCubit>(),
            child: Column(
              children: [
                // const SizedBox(height: 60,),
                Expanded(
                  child: BlocBuilder<TopRatedCubit, TopRatedState>(
                    bloc: sl<TopRatedCubit>()..getTopRated(),
                    builder: (context, state) {
                      if (state is GetTopRatedDataLoading) {
                        return Center(
                          child: CupertinoActivityIndicator(
                            color: AppColors.whiteColor,
                          ),
                        );
                      } else if (state is GetTopRatedDataSuccess) {
                        return SingleChildScrollView(
                          child: ListOfFavItems(
                            list: state.movieResponse,
                            isLoading: false,
                          ),
                        );
                      } else if (state is GetTopRatedDataError) {
                        return Center(
                          child: Text(state.error, style: K.yellowCardTextStyle),
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

    );
  }
}
