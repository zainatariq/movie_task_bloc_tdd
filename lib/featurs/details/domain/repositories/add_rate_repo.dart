



import '../../../../networking/api_service.dart';
import '../../../../networking/network_state.dart';
import '../../../homeScreen/data/models/add_profile_model.dart';
import '../../data/models/avata_model.dart';

abstract class AddRateRepo {
  Future<NetworkState<dynamic>> postARate(String movieId, double rate);
  //addFavorite
  Future<NetworkState<dynamic>> addFavorite(
      {required String movieId, });
  Future<NetworkState<dynamic>> deleteRating(
      {required String movieId });
}
