part of 'home_cubit.dart';




class HomeState extends Equatable {
  final int currentIndex;
  final int connectivityStatus;

  HomeState({
    this.currentIndex = 0,
    this.connectivityStatus = 1,
  });

  HomeState copyWith({int? currentIndex, int? connectivityStatus}) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      connectivityStatus: connectivityStatus ?? this.connectivityStatus,
    );
  }

  @override
  List<Object?> get props => [currentIndex, connectivityStatus];
}
