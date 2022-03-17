import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:klikdaily/domain/models/fruit.dart';
import 'package:klikdaily/domain/repositories/fruit_repository.dart';
import 'package:klikdaily/utils/request_state.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final FruitRepository repository;

  static const successAddMessage = "Success Add New Item";
  static const successRemoveMessage = "Success Remove New Item";

  CartBloc(this.repository) : super(CartState.initial()) {
    on<FetchingFruitToCart>((event, emit) async {
      emit(state.copyWith(requestState: RequestState.Loading));

      final result = await repository.getCarts();

      result.fold(
        (failure) => emit(state.copyWith(
            message: failure.message, requestState: RequestState.Error)),
        (fruits) => emit(
            state.copyWith(fruits: fruits, requestState: RequestState.Loaded)),
      );
    });

    on<AddFruitToCart>((event, emit) async {
      final result = await repository.isAddedInCart(event.fruit.id);

      await result.fold(
        (failure) async {
          final resAdd = await repository.addCart(event.fruit);

          resAdd.fold(
            (failure) => null,
            (message) => emit(state.copyWith(message: message)),
          );
        },
        (fruit) async {
          final updateFruit = fruit.copyWith(
              totalItems: fruit.totalItems + event.fruit.totalItems);

          final resUpdate = await repository.updateTotalItemsFruit(updateFruit);

          resUpdate.fold(
            (failure) => emit(state.copyWith(message: failure.message)),
            (message) => emit(state.copyWith(message: message)),
          );
        },
      );
    });

    on<AddFromListFruitToCart>((event, emit) async {
      Fruit? filterd;

      var update = <Fruit>[];

      for (var item in state.fruits) {
        if (item.id == event.fruit.id) {
          update.add(item.copyWith(totalItems: item.totalItems + 1));
          filterd = item.copyWith(totalItems: item.totalItems + 1);
        } else {
          update.add(item);
        }
      }

      emit(state.copyWith(fruits: update, message: successAddMessage));

      if (filterd != null) {
        await repository.updateTotalItemsFruit(filterd);
      }
    });

    on<RemoveFruitToCart>((event, emit) async {
      Fruit? filterd;

      var update = <Fruit>[];

      for (var item in state.fruits) {
        if (item.id == event.fruit.id) {
          update.add(item.copyWith(totalItems: item.totalItems - 1));
          filterd = item.copyWith(totalItems: item.totalItems - 1);
        } else {
          update.add(item);
        }
      }

      emit(state.copyWith(fruits: update, message: successRemoveMessage));

      if (filterd != null) {
        await repository.updateTotalItemsFruit(filterd);
      }
    });

    on<SetCurrentMessage>((event, emit) {
      emit(state.copyWith(message: ""));
    });

    on<ClearAllCart>((event, emit) async {
      final resAdd = await repository.removeAllCart();

      resAdd.fold(
        (failure) => emit(state.copyWith(message: failure.message)),
        (message) => emit(state.copyWith(message: message)),
      );
    });
  }
}
