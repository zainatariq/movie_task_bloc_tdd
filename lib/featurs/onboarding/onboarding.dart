 import 'package:bi/localization/change_language.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/util/app_consts.dart';
import '../../generated/assets.dart';
import '../../generated/locale_keys.g.dart';
import '../../injection_contanier.dart';
import 'componants/page_view_body.dart';
import 'controller/cubit/on_boarding_controller_cubit.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            BlocBuilder<OnBoardingControllerCubit, SplashState>(
              // bloc: OnBoardingControllerCubit.loadData(context),
              bloc:sl<OnBoardingControllerCubit>()..loadData(context),
              builder: (context, state) {
                OnBoardingControllerCubit cubit =
                    OnBoardingControllerCubit.get(context);

                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imagesLogoTransparentBackground,fit: BoxFit.fill,height: MediaQuery.of(context).size.height/2.4,),
                      K.sizedBoxH20,
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width - 100,
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: LinearProgressIndicator(
                            minHeight: 2,
                            color:Theme.of(context).primaryColor,
                            backgroundColor:Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                          ),
                        ),
                      )

                    ],
                  ),
                );
              },
            ),


      ),
    );
  }
}
