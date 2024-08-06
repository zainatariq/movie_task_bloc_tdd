


import 'package:bi/helper/nav.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import '../../../../../core/util/app_consts.dart';
import '../../../../../injection_contanier.dart';
import '../../../../homeScreen/data/models/add_profile_model.dart';
import '../../componants/movie_details.dart';
import '../../componants/poster/poster_rating_widget.dart';
import '../../manager/detaills_cubit.dart';
import '../../manager/detaills_state.dart';

class DetailPage extends StatelessWidget {
  final Movie _movie;

  const DetailPage(this._movie);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(sl(),sl(),sl())..loadMovieDetails(_movie),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            bool isLoading = state is DetailsLoading && state.c;

            return Stack(
              children: [
                NestedScrollView(
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).colorScheme.outline,
                            size: 25.sp,
                          ),
                          onPressed: () {
                            NavigationHelper.navigatePop(context);
                          },
                        ),
                        title: Text(
                          _movie.title,
                        ),
                        actions: [
                          IconButton(
                            icon: Icon(
                              // _movie.
                              context.read<DetailsCubit>().isFav?
                              Icons.favorite:
                              Icons.favorite_outline_outlined,
                              // Icons.favorite,
                              color: Theme.of(context).colorScheme.outline,
                              size: 25.sp,
                            ),
                            onPressed: () {
                              context.read<DetailsCubit>().addToFav(_movie.id.toString(), context: context);
                             },
                          ),
                        ],
                        pinned: true,
                      ),
                    ];
                  },
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            getMovieDetailsSection(_movie, context: context),
                            Positioned(
                              top: 100.h,
                              child: getMoviePosterAndRatingSection(context, _movie),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (isLoading)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
  }
