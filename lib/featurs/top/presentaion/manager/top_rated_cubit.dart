import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../homeScreen/data/models/add_profile_model.dart';
import '../../domain/use_case/top_rated.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final GetTopRatedUseCase getTopRatedUseCase;
  TopRatedCubit(
  {
    required this.getTopRatedUseCase,
  }
      ) : super(TopRatedInitial()){
    getTopRated();
  }


  getTopRated() async{
    emit(GetTopRatedDataLoading());
    final result = await getTopRatedUseCase();
    result.whenOrNull(
      success: (data) {
        emit(GetTopRatedDataSuccess(data.data!));
      },
      error: (message, errorList) {
        emit(GetTopRatedDataError(message!, ));
      },
    );
  }
}
