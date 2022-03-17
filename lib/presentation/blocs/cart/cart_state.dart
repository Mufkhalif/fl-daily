part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState({
    this.message = "",
    this.fruits = const [],
    this.requestState = RequestState.Empty,
  });

  final String message;
  final List<Fruit> fruits;
  final RequestState requestState;

  CartState copyWith({
    String? message,
    RequestState? requestState,
    List<Fruit>? fruits,
  }) =>
      CartState(
        message: message ?? this.message,
        fruits: fruits ?? this.fruits,
        requestState: requestState ?? this.requestState,
      );

  factory CartState.initial() => const CartState();

  @override
  List<Object> get props => [
        message,
        fruits,
        requestState,
      ];
}
