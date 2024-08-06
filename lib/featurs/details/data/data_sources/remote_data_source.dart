import '../../../../networking/api_service.dart';
import '../../../../networking/network_state.dart';
import '../../../homeScreen/data/models/add_profile_model.dart';

abstract class AddRateRemoteDataSource {
  Future<NetworkState<dynamic>> postARate(String movieId, double rate);
  //addFavorite
Future <NetworkState<dynamic>> addFavorite({required String movieId,});
//deleteRating

  Future<NetworkState<dynamic>> deleteRating({required String movieId });
}

class AddRateRemoteDataSourceImpl implements AddRateRemoteDataSource {
  ApiService consumer;

  AddRateRemoteDataSourceImpl({required this.consumer});

  @override
  Future<NetworkState<dynamic>> postARate(String movieId, double rate) async {
    return await consumer.addRating(movieId: movieId, rate: rate);
  }
  //addFavorite
  @override
  Future<NetworkState<dynamic>> addFavorite({required String movieId,}) async {
    return await consumer.addFavorite(movieId: movieId, );
  }
  //deleteRating
  @override
  Future<NetworkState<dynamic>> deleteRating({required String movieId }) async {
    return await consumer.deleteRating(movieId: movieId,  );
  }





}
