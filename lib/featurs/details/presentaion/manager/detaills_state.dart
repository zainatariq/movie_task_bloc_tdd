import 'package:equatable/equatable.dart';

import '../../../homeScreen/data/models/add_profile_model.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class DetailsInitial extends DetailsState {}
class DetailsLoading extends DetailsState {
  final bool c;
  const DetailsLoading(this.c);
}
class DetailsError extends DetailsState {
  final String message;

  DetailsError(this.message);
}

class DetailsLoaded extends DetailsState {
  final Movie movie;

  DetailsLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}
class IsFavState extends DetailsState {
  final bool isFav;
  IsFavState(this.isFav);
}
class DeleteState extends DetailsState {
  final double rate;

  DeleteState(this.rate);
}
