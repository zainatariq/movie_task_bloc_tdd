

import '../../../../networking/network_state.dart';
import '../../../homeScreen/data/models/add_profile_model.dart';

import '../repositories/search_repo.dart';

class SearchScreenUseCase {
  final SearchRepo repository;

  SearchScreenUseCase({required this.repository});

  Future<NetworkState<MovieResponse>> call(s ) async {
    return await repository.getOneSearch(s);
  }
}
