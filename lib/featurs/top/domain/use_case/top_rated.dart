




import '../../../../networking/network_state.dart';
import '../../../homeScreen/data/models/add_profile_model.dart';
import '../repo/top_rated_repo.dart';

class GetTopRatedUseCase {
  final TopRatedRepo repository;

  GetTopRatedUseCase({required this.repository});

  Future<NetworkState<MovieResponse>> call( ) async {
    return await repository.getTopRated();
  }
}
