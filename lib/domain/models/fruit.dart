import 'package:equatable/equatable.dart';
import 'package:klikdaily/utils/type_fruits.dart';

class Fruit extends Equatable {
  const Fruit({
    required this.id,
    required this.name,
    required this.price,
    required this.assets,
    required this.bgColor,
    required this.typeFruit,
    this.totalItems = 0,
  });

  final int id;
  final String name;
  final int price;
  final String assets;
  final String bgColor;
  final TypeFruit typeFruit;
  final int totalItems;

  Fruit copyWith({
    int? id,
    String? name,
    int? price,
    String? assets,
    String? bgColor,
    TypeFruit? typeFruit,
    int? totalItems,
  }) =>
      Fruit(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        assets: assets ?? this.assets,
        bgColor: bgColor ?? this.bgColor,
        typeFruit: typeFruit ?? this.typeFruit,
        totalItems: totalItems ?? this.totalItems,
      );

  factory Fruit.fromMap(Map<String, dynamic> map) => Fruit(
        id: map["id"],
        name: map["name"],
        price: map["price"],
        assets: map["assets"],
        bgColor: "red",
        typeFruit: stringToTypeFruit(map["typeFruit"]),
        totalItems: map["totalItems"],
      );

  @override
  List<Object> get props => [
        id,
        name,
        price,
        assets,
        bgColor,
        typeFruit,
        totalItems,
      ];
}
