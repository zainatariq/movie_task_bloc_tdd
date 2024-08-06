


import 'package:flutter/cupertino.dart';
import '../../../../homeScreen/data/models/add_profile_model.dart';

import '../banner.dart';

Widget getMoviePosterBackground(Movie _movie) {
  return Opacity(
    opacity: 0.6,
    child: ArcBannerImage(
        _movie.posterUrl ?? 'https://www.w3schools.com/css/paris.jpg', 300),
  );
}
