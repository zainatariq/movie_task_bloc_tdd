

import '../../../../networking/network_state.dart';
import '../../data/models/add_profile_model.dart';
import '../repositories/home_repo.dart';

class HomeScreenUseCase {
  final HomeRepo repository;// List<Movie> results;

  HomeScreenUseCase({required this.repository});

  Future<NetworkState<MovieResponse>> call( ) async {
    return await repository.getHomeData();
  }
}
