import 'dart:ui';
import 'package:bi/common/AppColors.dart';
import 'package:bi/featurs/homeScreen/presentaion/pages/widgets/custom_movie_cars.dart';
import 'package:bi/featurs/search/presentaion/pages/widgets/search_list.dart';
import 'package:bi/featurs/search/presentaion/pages/widgets/search_widget.dart';
import 'package:bi/generated/locale_keys.g.dart';
import 'package:bi/localization/change_language.dart';
import 'package:bi/route/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/app_consts.dart';
import '../../../../generated/assets.dart';
import '../../../../helper/nav.dart';
import '../../../../injection_contanier.dart';
import '../../../../route/paths.dart';
import '../../../../widgeta/custom_carousel.dart';
import '../manager/search_screen_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchScreenCubit>();

    return BlocProvider<SearchScreenCubit>(
      create: (context) => sl<SearchScreenCubit>(),
      child: Scaffold(
          body: SafeArea(
              child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              searchWidget(
                  searchController: cubit.searchController,
                  searchFocusNode: cubit.searchFocusNode,
                  onChanged: cubit.onChanged,
                  hint: LocaleKeys.search_for_specific_stores.tre,
                  // getCurrent: cubit.setCameraPosition,
                  onSubmit: (v) {
                    FocusScope.of(context).unfocus();
                  }),
              SizedBox(
                height: 15.h,
              ),
              BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) {
                    return
                        // Positioned(
                        // top: cubit.isContainerVisible
                        //     ? WidgetsBinding.instance.window
                        //     .viewInsets.bottom <
                        //     300
                        //     ? constraint.maxHeight /
                        //     3.7.h
                        //     : constraint.maxHeight / 2.h
                        //     : WidgetsBinding.instance.window
                        //     .viewInsets.bottom <
                        //     300
                        //     ? constraint.maxHeight / 4.h
                        //     : constraint.maxHeight /
                        //     2.7.h,
                        // left: 20.w,
                        // right: 20.w,
                        // bottom: WidgetsBinding
                        //     .instance
                        //     .window
                        //     .viewInsets
                        //     .bottom <
                        //     300
                        //     ? 0.h
                        //     : 12,
                        // child:
                        SearchListWidget(
                      loading: state is LoadingSearchingSuggestion ||
                          cubit.isDataLoading,
                      listOfSearchedPlaces: cubit.searchResultsFrom,
                      onTap: (item) {
                        cubit.getLocationOfSelectedSearchItem(
                            context: context, item);
                        cubit.resetState();
                      },
                      inputTextField: cubit.searchController,
                      // )
                    );
                  })
            ],
          ),
        ),
      ))),
    );
  }
}
