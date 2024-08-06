import 'dart:convert';

import 'package:bi/featurs/homeScreen/data/models/add_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../featurs/allMovies/presentaion/pages/allMovies.dart';
import '../featurs/details/presentaion/manager/detaills_cubit.dart';
import '../featurs/details/presentaion/pages/detailsScreen/ui.dart';
import '../featurs/home/presentaion/manager/home_cubit.dart';
import '../featurs/home/presentaion/pages/home.dart';
import '../featurs/homeScreen/presentaion/manager/home_screen_cubit.dart';
import '../featurs/homeScreen/presentaion/pages/home_screen.dart';
import '../featurs/search/presentaion/manager/search_screen_cubit.dart';
import '../featurs/search/presentaion/pages/search_screen.dart';
import '../injection_contanier.dart';
import '../widgeta/chucker_flutter_page.dart';
import '../featurs/onboarding/controller/cubit/on_boarding_controller_cubit.dart';
import '../featurs/onboarding/onboarding.dart';
import 'paths.dart';

class AppRouteManger {
  static String get initial {
     return AppPaths.splash;
  }

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case AppPaths.splash:
        return _materialRoute(BlocProvider(
          create: (context) => OnBoardingControllerCubit(),
          child: const OnBoardingScreen(),
        ));
  case AppPaths.home:
        return _materialRoute(BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
          child:   Home(),
        ));

  case AppPaths.homeScreen:
        return _materialRoute(BlocProvider(
          create: (context) => HomeScreenCubit(homeScreenUseCase: sl(), ),
          child:   HomeScreen(),
        ));



case AppPaths.detailsScreen:
  var args = (settings.arguments ?? {}) as Map<String, dynamic>;
        return _materialRoute(BlocProvider(
          create: (context) => DetailsCubit(sl(),sl(),sl()  ),
          child:   DetailPage(
        Movie.fromJson(args)
          ),
        ));



case AppPaths.allMoviesScreen :
  var args = (settings.arguments ?? []) as List< Movie>;
        return _materialRoute(BlocProvider(
          create: (context) => DetailsCubit(sl(),sl(),sl() ),
          child:   AllMoviesScreen(// <Movie>[];
            list: args,
          ),
        ));


case AppPaths.searchScreen:
        return _materialRoute(BlocProvider(
          create: (context) => SearchScreenCubit(sl()),
          child: const SearchScreen(),
        ));


        // case AppPaths.detailsScreen :
        // return _materialRoute(BlocProvider(
        //   create: (context) => DetailsCubit(),
        //   child: const DetailsScreen(),
        // ));
        // case AppPaths.allMoviesScreen :
        //   var args = (settings.arguments ?? {}) as Map<String, dynamic>;
        //
        //   return _materialRoute(BlocProvider(
        //   create: (context) => AllMoviesCubit(),
        //   child: const AllMoviesScreen(
        //     args: args,
        //   ),
        // ));


      default:
        return _materialRoute(const Scaffold());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => ChuckerFlutterPage(child: view));
  }
}
