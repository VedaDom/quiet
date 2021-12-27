import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiet/core/error/failues.dart';
import 'package:quiet/features/favorites/domain/entities/favorite.dart';
import 'package:quiet/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:quiet/features/favorites/domain/usecases/get_favorites.dart';

final tFavorites = [
  const Favorite(
    name: "Test one",
    package: "com.company.testone",
    icon: "test.png",
  ),
];

Future<Either<Failure, List<Favorite>>> tValue() async {
  return Right(tFavorites);
}

class MockFavoritesRepository extends Mock implements FavoritesRepository {
  @override
  Future<Either<Failure, List<Favorite>>> getFavorites() {
    return super.noSuchMethod(
      Invocation.getter(#getFavorites),
      returnValue: tValue(),
    );
  }
}

void main() {
  late MockFavoritesRepository mockFavoritesRepository;
  late GetFavorites usecase;

  setUp(() {
    mockFavoritesRepository = MockFavoritesRepository();
    usecase = GetFavorites(mockFavoritesRepository);
  });

  test("should get favorite apps from the repository", () async {
    // arrage
    when(mockFavoritesRepository.getFavorites())
        .thenAnswer((_) async => Right(tFavorites));
    // act
    final result = await usecase();
    // assert
    expect(result, Right(tFavorites));
  });
}
