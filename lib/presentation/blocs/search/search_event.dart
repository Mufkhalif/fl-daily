part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchFruit extends SearchEvent {
  final String query;
  const SearchFruit(this.query);

  @override
  List<Object> get props => [query];
}
