import 'package:klikdaily/data/datasource/db/database_helper.dart';
import 'package:klikdaily/domain/models/fruit.dart';
import 'package:klikdaily/utils/exception.dart';

abstract class FruitLocalDataSource {
  Future<String> addCart(Fruit fruit);
  Future<Fruit?> getFruitByType(int id);
  Future<String> updateTotalItemsFruit(Fruit fruit);
  Future<List<Fruit>> getCarts();
}

class FruitLocalDataSourceImpl implements FruitLocalDataSource {
  final DatabaseHelper databaseHelper;

  FruitLocalDataSourceImpl(this.databaseHelper);

  @override
  Future<String> addCart(Fruit fruit) async {
    try {
      await databaseHelper.addCart(fruit);
      return 'Added to Cart';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<Fruit?> getFruitByType(int id) async {
    final result = await databaseHelper.getFruitByType(id);
    if (result != null) {
      return Fruit.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<String> updateTotalItemsFruit(Fruit fruit) async {
    try {
      await databaseHelper.updateTotalItemsFruit(fruit);
      return 'Update items ${fruit.name} to Cart';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<Fruit>> getCarts() async {
    try {
      final result = await databaseHelper.getCarts();
      return result.map((data) => Fruit.fromMap(data)).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
