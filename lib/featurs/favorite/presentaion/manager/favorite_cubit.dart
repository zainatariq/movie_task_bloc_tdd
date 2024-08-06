import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../homeScreen/data/models/add_profile_model.dart';
import '../../domain/use_case/fav_use_case.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final GetFavoriteUseCase getFavoriteUseCase;


  FavoriteCubit(
  { required this.getFavoriteUseCase,}
      ) : super(FavoriteInitial()){
    getFavorite();
  }


  getFavorite() async{
    emit(GetFavoriteDataLoading());

    final state = await getFavoriteUseCase();
    state.whenOrNull(
      success: (data) {
        emit(GetFavoriteDataSuccess(data.data!));
      },
      error: (message, errorList) {
        emit(GetFavoriteDataError(message!, []));
      },
    );
  }
}
