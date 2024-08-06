
import '../featurs/details/data/models/avata_model.dart';
import '../featurs/homeScreen/data/models/add_profile_model.dart';
import 'DioClient.dart';
import 'mock_ups_path.dart';

import 'api_constants.dart';
import 'network_service.dart';
import 'network_state.dart';

// part 'api_service.g.dart';
//
// @RestApi(baseUrl: APiConstants.BASE_DEV_URL_With_User)
class ApiService {
  final NetworkService _networkService;
  ApiService(this._networkService);

  Future<NetworkState<MovieResponse>> getMovies() async {
    return await _networkService.invokeRequest(
        method: HttpMethods.get,
        converter: (json) => MovieResponse.fromJson(json),
        endpoint: APiConstants.getMovies,
        isMockupRequest: false);
  }
  Future<NetworkState<MovieResponse >> getOneSearch(String search) async {
    return await _networkService.invokeRequest(
        method: HttpMethods.get,
        converter: (json) => MovieResponse.fromJson(json),
        endpoint: APiConstants.getOneSearch,
        queryParams:{"query": search},
        isMockupRequest: false);
  }
 Future<NetworkState<UpdateResponse >> addRating(
      {required String movieId,required double rate}) async {
    return await _networkService.invokeRequest(
        method: HttpMethods.post,
        converter: (json) =>UpdateResponse.fromJson(json),
        endpoint: APiConstants.addRating.replaceAll('{movie_id}', movieId),
        isFormData: true,
        data:{"value": rate},
        isMockupRequest: false);
  }

///____________________

  Future<NetworkState<  UpdateResponse>> addFavorite(
      {required String movieId, }) async {
    return await _networkService.invokeRequest(
        method: HttpMethods.post,
        converter: (json) =>UpdateResponse.fromJson(json),
        endpoint: APiConstants.addFav,
        isFormData: true,
        data:{
          "media_type": "movie",
          "media_id": movieId,
          "favorite": true
        },
        isMockupRequest: false);
  }

  Future<NetworkState<MovieResponse>> getFavorites() async {//movies
    return await _networkService.invokeRequest(
        method: HttpMethods.get,
        converter: (json) => MovieResponse.fromJson(json),
        endpoint: '${APiConstants.addFav}/movies',
        isMockupRequest: false);
  }
  Future<NetworkState<MovieResponse>> getTopRated() async {//movies
    return await _networkService.invokeRequest(
        method: HttpMethods.get,
        converter: (json) => MovieResponse.fromJson(json),
        endpoint:  APiConstants.getTopRated,
        isMockupRequest: false);
  }

  Future<NetworkState<UpdateResponse >> deleteRating(
      {required String movieId, }) async {
    return await _networkService.invokeRequest(
        method: HttpMethods.delete,
        converter: (json) =>UpdateResponse.fromJson(json),
        endpoint: APiConstants.addRating.replaceAll('{movie_id}', movieId),
        isFormData: true,
        isMockupRequest: false);
  }
}
