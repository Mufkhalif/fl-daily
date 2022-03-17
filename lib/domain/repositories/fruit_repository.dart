import 'package:dartz/dartz.dart';
import 'package:klikdaily/domain/models/fruit.dart';
import 'package:klikdaily/domain/models/profile.dart';
import 'package:klikdaily/utils/failure.dart';

abstract class FruitRepository {
  Future<Either<Failure, String>> addCart(Fruit fruit);
  Future<Either<Failure, Fruit>> isAddedInCart(int id);
  Future<Either<Failure, String>> updateTotalItemsFruit(Fruit fruit);
  Future<Either<Failure, List<Fruit>>> getCarts();
  Future<Either<Failure, ProfileResponse>> getProfile();
}
