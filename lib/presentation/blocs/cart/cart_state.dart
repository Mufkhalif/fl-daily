part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState({
    this.message = "",
    this.requestState = RequestState.Empty,
    this.fruits = const [],
  });

  final String message;
  final RequestState requestState;
  final List<Fruit> fruits;

  CartState copyWith({
    String? message,
    RequestState? requestState,
    List<Fruit>? fruits,
  }) =>
      CartState(
        message: message ?? this.message,
        requestState: requestState ?? this.requestState,
        fruits: fruits ?? this.fruits,
      );

  factory CartState.initial() => const CartState();

  @override
  List<Object> get props => [
        message,
        requestState,
        fruits,
      ];
}
