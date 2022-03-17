part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class FetchingFruitToCart extends CartEvent {}

class AddFruitToCart extends CartEvent {
  final Fruit fruit;

  const AddFruitToCart(this.fruit);

  @override
  List<Object> get props => [fruit];
}

class RemoveFruitToCart extends CartEvent {
  final Fruit fruit;

  const RemoveFruitToCart(this.fruit);

  @override
  List<Object> get props => [fruit];
}

class AddFromListFruitToCart extends CartEvent {
  final Fruit fruit;

  const AddFromListFruitToCart(this.fruit);

  @override
  List<Object> get props => [fruit];
}

class SetCurrentMessage extends CartEvent {}

class AddFruitToCartByTotal extends CartEvent {
  final Fruit fruit;

  const AddFruitToCartByTotal(this.fruit);

  @override
  List<Object> get props => [fruit];
}
