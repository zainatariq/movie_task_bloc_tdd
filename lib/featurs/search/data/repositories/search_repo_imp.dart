
import 'package:bi/featurs/search/domain/repositories/search_repo.dart';
import '../../../../networking/network_state.dart';
import '../../../homeScreen/data/models/add_profile_model.dart';
import '../data_source/remote_data_source.dart';



class SearchRepoImp implements SearchRepo {
  final GetSearchedMovieRemoteDataSource _remoteDataSource;

  SearchRepoImp(this._remoteDataSource);
  @override
  Future<NetworkState<MovieResponse >>  getOneSearch( String search) async{
    return _remoteDataSource.getOneSearch( search );
  }

}
