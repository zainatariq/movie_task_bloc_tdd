




import '../../../../networking/network_state.dart';
import '../../../homeScreen/data/models/add_profile_model.dart';
import '../../../homeScreen/domain/repositories/home_repo.dart';

class GetFavoriteUseCase {
  final HomeRepo repository;

  GetFavoriteUseCase({required this.repository});

  Future<NetworkState<MovieResponse>> call( ) async {
    return await repository.getFavorite();
  }
}
