



import '../repositories/add_rate_repo.dart';

class AddFavUseCase {
  final AddRateRepo repository;

  AddFavUseCase({required this.repository});

  call(String movieId) async {
    return await repository.addFavorite(movieId: movieId);
  }
}
