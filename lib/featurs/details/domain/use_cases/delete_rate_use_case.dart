




import '../repositories/add_rate_repo.dart';

class DeleteFavUseCase {
  final AddRateRepo repository;

  DeleteFavUseCase({required this.repository});

  call(String movieId) async {
    return await repository.deleteRating(movieId: movieId);
  }
}
