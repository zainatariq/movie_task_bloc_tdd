import '../../../../networking/api_service.dart';
import '../../../../networking/network_state.dart';
import '../../../homeScreen/data/models/add_profile_model.dart';

abstract class TopRatedMoviesRemoteDataSource {
  Future<NetworkState<MovieResponse>> getTopRated();


}

class TopRatedMoviesRemoteDataSourceImpl
    implements TopRatedMoviesRemoteDataSource {
  ApiService consumer;

  TopRatedMoviesRemoteDataSourceImpl({required this.consumer});

  @override
  Future<NetworkState<MovieResponse>> getTopRated()async {
    return await consumer.getTopRated();

  }


}
