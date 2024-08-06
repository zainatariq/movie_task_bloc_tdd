
import 'package:bi/featurs/homeScreen/data/models/add_profile_model.dart';

import 'package:bi/networking/network_state.dart';
import '../../../../networking/api_service.dart';
import '../../domain/repo/top_rated_repo.dart';
import '../data_source/remote_data_source.dart';


class TopRatedRepoImp implements TopRatedRepo {
  final TopRatedMoviesRemoteDataSource topRatedMoviesRemoteDataSource;

  TopRatedRepoImp({required this.topRatedMoviesRemoteDataSource});

  @override
  Future<NetworkState<MovieResponse>> getTopRated()async {

    return  await topRatedMoviesRemoteDataSource.getTopRated();
  }

}
