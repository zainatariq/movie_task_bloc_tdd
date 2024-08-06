import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/AppColors.dart';
import '../../../../core/util/app_consts.dart';
import '../../../../generated/assets.dart';
import '../../../../injection_contanier.dart';
import '../componant/list_items.dart';
import '../manager/favorite_cubit.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.all(10.sp),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesBg),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 3.0),
        child: BlocProvider<FavoriteCubit>(
            create: (context) => sl<FavoriteCubit>(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
                minWidth: MediaQuery.of(context).size.width,
              ),
              child:
              Column(
                children: [
                  BlocBuilder<FavoriteCubit, FavoriteState>(
                    bloc: sl<FavoriteCubit>()..getFavorite(),
                    builder: (context, state) {
                      if (state is GetFavoriteDataLoading) {
                        return
                          Container(
                            height: MediaQuery.of(context).size.height/2,
                            width: MediaQuery.of(context).size.width,
                            child:   CupertinoActivityIndicator(
                              color: AppColors.whiteColor,
                            ),
                          ) ;
                      } else if (state is GetFavoriteDataSuccess) {
                         return Expanded(
                          child: ListOfFavItems(
                            list: state.movieResponse,
                            isLoading: false,
                          ),
                        );
                      } else if (state is GetFavoriteDataError) {
                        return Text(state.message, style: K.yellowCardTextStyle);

                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}


