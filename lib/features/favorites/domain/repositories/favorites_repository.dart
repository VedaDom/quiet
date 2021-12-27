import 'package:dartz/dartz.dart';

import '../../../../core/error/failues.dart';
import '../entities/favorite.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<Favorite>>> getFavorites();
}
