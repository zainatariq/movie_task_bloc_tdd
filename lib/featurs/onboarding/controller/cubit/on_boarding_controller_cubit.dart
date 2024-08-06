import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/assets.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../helper/nav.dart';
import '../../../../route/paths.dart';
import '../../../../widgeta/connection_dialog.dart';
import '../../model/onboard_model.dart';

part 'on_boarding_controller_state.dart';

class OnBoardingControllerCubit extends Cubit<SplashState> {
  OnBoardingControllerCubit() : super(InitialState());

  static OnBoardingControllerCubit get(context) =>
      BlocProvider.of<OnBoardingControllerCubit>(context);



  Future<void> loadData(BuildContext context) async {
    log('Splash :::: Checking connectivity '
        ''
        ''
        '');
    emit(LoadingState());
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        showDialogBox(
          context,
          onRetry: () {
            loadData(context);
          },
        );
        return;
      }

      await Future.delayed(const Duration(seconds: 5));
      bool isOpenedBefore = true;
      log('Splash :::: $isOpenedBefore');


      if (!isOpenedBefore) {
        emit(SuccessState(isOpenedBefore: isOpenedBefore, token: null, savedMobile: null));
       } else {

          emit(SuccessState(isOpenedBefore: isOpenedBefore, token: null, savedMobile: null));
          NavigationHelper.navigateAfterBuild(context, AppPaths.home);

      }
    } catch (e) {
      emit(ErrorState());
    }
  }

}
