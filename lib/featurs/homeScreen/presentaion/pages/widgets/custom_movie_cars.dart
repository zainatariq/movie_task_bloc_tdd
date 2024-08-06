
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/util/app_consts.dart';
import '../../../../../helper/nav.dart';
import '../../../../../route/paths.dart';
import '../../../../../widgeta/custom_card.dart';
import '../../../data/models/add_profile_model.dart';
class CustomMovieCard extends StatelessWidget {
  Movie movie;
    CustomMovieCard({Key? key,required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: 180.w,
          margin:
          const EdgeInsets.only(right: 10, top: 5, bottom: 5),
          // decoration: K.whiteBoxDecorationWithShadow,
          decoration: K.boxDecorationLightGrey,
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: CustomCard(
                  image: movie.posterUrl,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Container(
                        color:   Theme.of( context). colorScheme.outlineVariant,
                        padding:
                        EdgeInsets.only(right: 13.0),
                        child: Text(
                          '\t${movie.title}', style: K.blackCardBoldTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ))
            ],
          )),
      onTap: () {

        NavigationHelper.navigateTo(context, AppPaths. detailsScreen,
            arguments: movie.toMap());
        // Get.to(DetailPage(movie));
      },
    );
  }
}
