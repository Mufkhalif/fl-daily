import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:klikdaily/data/datasource/store/list_fruits.dart';
import 'package:klikdaily/domain/models/fruit.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchFruit>((event, emit) {
      final filterd = fruits
          .where((food) =>
              food.name.toLowerCase().contains(event.query.toLowerCase()))
          .toList();

      emit(SearchHasData(filterd));
    });
  }
}
