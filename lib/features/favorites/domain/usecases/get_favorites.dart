import 'package:dartz/dartz.dart';
import 'package:quiet/core/error/failues.dart';
import 'package:quiet/features/favorites/domain/entities/favorite.dart';

import '../repositories/favorites_repository.dart';

class GetFavorites {
  final FavoritesRepository repository;

  GetFavorites(this.repository);

  Future<Either<Failure, List<Favorite>>> call() {
    return repository.getFavorites();
  }
}
