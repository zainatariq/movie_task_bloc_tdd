import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import '../../../../helper/nav.dart';
import '../../../homeScreen/data/models/add_profile_model.dart';
import '../../domain/use_cases/add_fav_use_case.dart';
import '../../domain/use_cases/add_rate_use_case.dart';
import '../../domain/use_cases/delete_rate_use_case.dart';
import 'detaills_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final AddRateUseCase addRateUseCase;
  final AddFavUseCase addFavUseCase;
  final DeleteFavUseCase deleteFavUseCase;

  DetailsCubit(
    this.addRateUseCase,
    this.addFavUseCase,
    this.deleteFavUseCase,
      ) : super(DetailsInitial());

  double ?rate;
    loadMovieDetails(Movie movie) {
    emit(DetailsLoaded(movie));
  }

  void rateMovie(String movieId, {required double rating, required BuildContext context}) async {
    rate=null;
    emit(const DetailsLoading(true));

    final result = await addRateUseCase(movieId, rating);
     result.whenOrNull(
      success: (data) {
        emit(IsFavState(isFav));
            _showRatingDialog(context, rating,movieId);
      },
      error: (message, errorList) {
            emit(DetailsError(message));
            NavigationHelper.navigatePop(context);
      },
    );
    // emit(const DetailsLoading(false));
  }

  void _showRatingDialog(BuildContext context, double rating,movieId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thank You!'),
          content: Text('You have rated the movie $rating stars.'),
          actions: [

            TextButton(
              onPressed: ()async {
               await deleteFromFav(movieId,   context: context);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              child:   Text('Delete rating'),
            ), TextButton(
              onPressed: () {

                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(backgroundColor: Colors.black),
              child: Text('OK'),
            ),
          ],
        );
      },
    );

  }
  ///----


addToFav(String movieId ,{required BuildContext context}) async {
     emit(const DetailsLoading(true));
    final result = await addFavUseCase(movieId,);
// log('result   ===$result');
    result.whenOrNull(
      success: (data) {
        log('success   ===$data');
        // _showRatingDialog(context, 'this ');
        marktheFavIcon( );
        emit(DetailsLoaded(data));
      },
      error: (message, errorList) {
        log('failure   ===$message');
        emit(DetailsError(message));
        NavigationHelper.navigatePop(context);
      },
    );
  }
  bool isFav = false;
marktheFavIcon( ) {
    isFav = !isFav;
    emit(IsFavState(isFav));
}
deleteFromFav(String movieId ,{required BuildContext context}) async {
  NavigationHelper.navigatePop(context);
     emit(const DetailsLoading(true));
    final result = await deleteFavUseCase(movieId,);

    result.whenOrNull(
      success: (data) {
        rate=0.0;
        emit(DeleteState(rate!));
      },
      error: (message, errorList) {
        log('failure   ===$message');
        emit(DetailsError(message));
        NavigationHelper.navigatePop(context);
      },
    );
  }

}
