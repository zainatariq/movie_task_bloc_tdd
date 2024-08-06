
import '../../../homeScreen/data/models/add_profile_model.dart';
import '../../../../networking/network_state.dart';



abstract class SearchRepo {

  Future<NetworkState<MovieResponse >> getOneSearch(String search) ;
}

