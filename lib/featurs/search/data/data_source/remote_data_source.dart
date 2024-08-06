import '../../../../networking/api_service.dart';
import '../../../../networking/network_state.dart';
import '../../../homeScreen/data/models/add_profile_model.dart';

abstract class GetSearchedMovieRemoteDataSource {
  Future<NetworkState<MovieResponse>> getOneSearch(String search);
}

class GetSearchedMovieRemoteDataSourceImpl
    implements GetSearchedMovieRemoteDataSource {
  ApiService consumer;

  GetSearchedMovieRemoteDataSourceImpl({required this.consumer});

  @override
  Future<NetworkState<MovieResponse>> getOneSearch(String search) async {
    return await consumer.getOneSearch(search);
  }
}
