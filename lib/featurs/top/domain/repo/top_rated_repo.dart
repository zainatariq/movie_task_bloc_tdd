import '../../../../networking/network_state.dart';
import '../../../homeScreen/data/models/add_profile_model.dart';

abstract class TopRatedRepo {
  Future<NetworkState<MovieResponse>> getTopRated();
}
