
import '../../data/models/add_profile_model.dart';
import '../../../../networking/network_state.dart';



abstract class HomeRepo {

  Future<NetworkState<MovieResponse>> getHomeData();
  Future<NetworkState<MovieResponse>> getFavorite();

}

