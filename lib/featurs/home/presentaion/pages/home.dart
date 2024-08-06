import 'package:bi/localization/change_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/app_consts.dart';
import '../../../../data.dart';
import '../../../../generated/assets.dart';
import '../../../../widgeta/custom_botto0m_nav_bar.dart';
import '../manager/home_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              title: Text(
                  bottomNavBarData
                      .elementAt(
                          context.read<HomeCubit>().state.currentIndex)['label']
                      .toString()
                      .toUpperCase(),
                  style: K.blackCardBoldTextStyle),
              centerTitle: false,
              actions: [],
              leading: null,
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.connectivityStatus == 1) {
                  return bodyScreens.elementAt(state.currentIndex);
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Assets.imagesIcNoConnection,
                            height: 300.h,
                            width: 300.w,
                            color: Theme.of(context).primaryColor),
                        Text('No Connection'.tre,
                            style: K.blackCardBoldTextStyle),
                      ],
                    ),
                  );
                }
              },
            ),
            bottomNavigationBar: CustomBottomNavBar(
              onTap: (v) {
                context.read<HomeCubit>().changeTabIndex(v);
              },
              currentIndex: state.currentIndex,
              bottomNavBarData: bottomNavBarData,
            ));
      },
    );
  }
}
