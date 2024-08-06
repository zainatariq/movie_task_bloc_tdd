part of 'top_rated_cubit.dart';

@immutable
sealed class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class GetTopRatedDataLoading extends TopRatedState {}

class GetTopRatedDataSuccess extends TopRatedState {
  final  List<Movie>  movieResponse;

  GetTopRatedDataSuccess(this.movieResponse);
}

class GetTopRatedDataError extends TopRatedState {
  final String error;

  GetTopRatedDataError(this.error);
}




