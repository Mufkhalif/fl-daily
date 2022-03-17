part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchHasData extends SearchState {
  final List<Fruit> result;
  const SearchHasData(this.result);

  @override
  List<Object> get props => [result];
}
