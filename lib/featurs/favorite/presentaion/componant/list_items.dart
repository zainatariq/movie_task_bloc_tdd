
import 'package:flutter/cupertino.dart';
import '../../../../common/AppColors.dart';
import '../../../homeScreen/data/models/add_profile_model.dart';
import 'fav_item.dart';

class ListOfFavItems extends StatelessWidget {
  final List<Movie> list;
  final bool isLoading;

  const ListOfFavItems({super.key, required this.list, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty || isLoading) {
      return  Container(
        height: MediaQuery.of(context).size.height/4,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x00000000),
              AppColors.blackColor,
            ],
          ),
        ),
        child:   CupertinoActivityIndicator(
          color: AppColors.primaryAppColor,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: list.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int itemIndex) {
          final movies = list.reversed.toList();
          final movie = movies[itemIndex];
          return FavItem(movie: movie);
        },
      );
    }
  }
}
