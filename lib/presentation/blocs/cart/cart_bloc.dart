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

      result.fold(
        (failure) async {
          final resAdd = await repository.addCart(event.fruit);

          resAdd.fold(
            (failure) => null,
            (message) => emit(state.copyWith(message: message)),
          );
        },
        (fruit) async {
          final updateFruit = fruit.copyWith(totalItems: fruit.totalItems + 1);

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

        // resUpdate.fold(
        //   (failure) => print("FAILED ADD CART : ${failure.message}"),
        //   (message) => print("SUCCESS ADD FROM CART"),
        // );
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

        // resUpdate.fold(
        //   (failure) => print("FAILED REMOVE CART : ${failure.message}"),
        //   (message) => print("SUCCESS REMOVE FROM CART"),
        // );
      }

      // final indexEmpty =
      //     state.fruits.indexWhere((element) => element.id == event.fruit.id);

      // final newList = state.fruits;

      // newList[indexEmpty]
      //     .copyWith(totalItems: newList[indexEmpty].totalItems - 1);

      // print(newList);

      // final result = await repository.isAddedInCart(event.fruit.id);

      // result.fold(
      //   (failure) async {
      //     print("REMOVE FAILURE EVENT MESSAGE ${failure.message}");
      //     // final resAdd = await repository.addCart(event.fruit);

      //     // resAdd.fold(
      //     //   (failure) => print(failure.message),
      //     //   (message) => print(message),
      //     // );
      //   },
      //   (fruit) async {
      //     print("REMOVE SUCCESS EVENT MESSAGE BEFORE ${fruit.totalItems}");

      //     final updateFruit = fruit.copyWith(totalItems: fruit.totalItems - 1);

      //     print("REMOVE SUCCESS EVENT MESSAGE AFTER ${updateFruit.totalItems}");

      // final resUpdate = await repository.updateTotalItemsFruit(updateFruit);

      // resUpdate.fold(
      //   (failure) => print(failure.message),
      //   (message) => print(message),
      // );

      //     // print(updateFruit.totalItems);
      //     // updateTotalItemsFruit/
      //   },
      // );
    });

    on<SetCurrentMessage>((event, emit) {
      emit(state.copyWith(message: ""));
    });
  }
}
