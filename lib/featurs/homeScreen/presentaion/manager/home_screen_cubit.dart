import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/add_profile_model.dart';
import '../../domain/use_cases/use_case.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final  HomeScreenUseCase homeScreenUseCase;
  // final GetFavoriteUseCase getFavoriteUseCase;
  HomeScreenCubit({ required this.homeScreenUseCase
  }) : super(HomeScreenInitial()){
    getMovies();
  }
 List<Movie> ?res;
  getMovies( ) async {
    emit(  GetMoviesDataLoading( ));
    final state = await homeScreenUseCase();
    state.whenOrNull(
      success: (data) {
        res = data.data;
         emit(GetMoviesDataSuccess(res!));
      },
      error: (message, errorList) {
         emit( GetMoviesDataError(message!,[]));
      },
    );
  }

}
