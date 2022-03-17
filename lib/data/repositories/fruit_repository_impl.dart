import 'package:klikdaily/data/datasource/fruit_localdata_source.dart';
import 'package:klikdaily/domain/models/fruit.dart';
import 'package:dartz/dartz.dart';
import 'package:klikdaily/domain/repositories/fruit_repository.dart';
import 'package:klikdaily/utils/exception.dart';
import 'package:klikdaily/utils/failure.dart';

class FruitRepositoryImpl implements FruitRepository {
  final FruitLocalDataSource localDataSource;

  FruitRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, String>> addCart(Fruit fruit) async {
    try {
      final result = await localDataSource.addCart(fruit);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Fruit>> isAddedInCart(int id) async {
    final result = await localDataSource.getFruitByType(id);

    if (result != null) {
      return Right(result);
    } else {
      return const Left(DatabaseFailure('Empty data for this fruit'));
    }
  }

  @override
  Future<Either<Failure, String>> updateTotalItemsFruit(Fruit fruit) async {
    try {
      final result = await localDataSource.updateTotalItemsFruit(fruit);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Fruit>>> getCarts() async {
    try {
      final result = await localDataSource.getCarts();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}
