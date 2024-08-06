import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());



  static HomeCubit get(context) =>
      BlocProvider.of<HomeCubit>(context);
  void changeTabIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void updateConnectivity(int status) {
    emit(state.copyWith(connectivityStatus: status));
  }
}
