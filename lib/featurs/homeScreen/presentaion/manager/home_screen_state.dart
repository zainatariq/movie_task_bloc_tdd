part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}
final class GetMoviesDataLoading extends HomeScreenState {}
final class GetMoviesDataSuccess extends HomeScreenState {
  final  List<Movie>  movieResponse;
  GetMoviesDataSuccess(this.movieResponse);

}

class GetMoviesDataError extends HomeScreenState {
  final String message;
  final List<String> errorList;
  GetMoviesDataError(this.message, this.errorList);
}

