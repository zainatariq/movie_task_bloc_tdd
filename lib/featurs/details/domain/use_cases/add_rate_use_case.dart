
import '../repositories/add_rate_repo.dart';


class AddRateUseCase {
  final AddRateRepo repository;

  AddRateUseCase({required this.repository});

  call(String movieId, double rate) async {
    return await repository.postARate(movieId, rate);
  }
}

///addFav
