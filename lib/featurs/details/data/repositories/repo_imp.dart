import 'package:bi/featurs/details/data/models/avata_model.dart';
import 'package:bi/networking/network_state.dart';
import '../../domain/repositories/add_rate_repo.dart';
import '../data_sources/remote_data_source.dart';


class AddRateRepoImp implements AddRateRepo {
  final AddRateRemoteDataSource _remoteDataSource;
  AddRateRepoImp(this._remoteDataSource);

  @override
  Future<NetworkState> postARate(String movieId, double rate) {
   return _remoteDataSource.postARate(movieId, rate);
  }


  @override
  Future<NetworkState<dynamic>> addFavorite({required String movieId,}) async {
    return await _remoteDataSource.addFavorite(movieId: movieId, );
  }
  //deleteRating
  @override
  Future<NetworkState<dynamic>> deleteRating({required String movieId }) async {
    return await _remoteDataSource.deleteRating(movieId: movieId );
  }




}
