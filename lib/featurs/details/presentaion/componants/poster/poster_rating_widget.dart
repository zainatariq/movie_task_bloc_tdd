

import 'package:bi/featurs/details/presentaion/componants/poster/poster_image_widget.dart';
import 'package:bi/featurs/details/presentaion/componants/poster/raing_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../../homeScreen/data/models/add_profile_model.dart';
Widget getMoviePosterAndRatingSection(BuildContext context,Movie _movie ) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      getMoviePoster(context,_movie),
      getRating(_movie),
    ],
  );
}
