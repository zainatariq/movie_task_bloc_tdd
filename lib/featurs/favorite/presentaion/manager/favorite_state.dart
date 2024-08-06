part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}
class GetFavoriteDataLoading extends FavoriteState {}
class GetFavoriteDataSuccess extends FavoriteState {
  final  List<Movie>  movieResponse;
  GetFavoriteDataSuccess(this.movieResponse);
}
class GetFavoriteDataError extends FavoriteState {
  final String message;
  final List<String> errorList;
  GetFavoriteDataError(this.message, this.errorList);
}