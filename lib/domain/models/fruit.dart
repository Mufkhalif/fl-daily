import 'package:klikdaily/utils/type_fruits.dart';

class Fruit {
  Fruit({
    required this.id,
    required this.name,
    required this.price,
    required this.assets,
    required this.bgColor,
    required this.typeFruit,
  });

  final int id;
  final String name;
  final int price;
  final String assets;
  final String bgColor;
  final TypeFruit typeFruit;
}
