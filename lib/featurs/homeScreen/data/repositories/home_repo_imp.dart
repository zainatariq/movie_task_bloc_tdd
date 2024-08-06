


import '../../../../networking/api_service.dart';
import '../../../../networking/network_state.dart';
import '../../domain/repositories/home_repo.dart';
import '../models/add_profile_model.dart';


class HomeRepoImp implements HomeRepo {
  final ApiService apiService;

  HomeRepoImp({required this.apiService});

  @override
  Future<NetworkState<MovieResponse>> getHomeData() {
    return apiService.getMovies();
   }
@override
  Future<NetworkState<MovieResponse>> getFavorite() {
    return apiService.getFavorites();
   }
 }
