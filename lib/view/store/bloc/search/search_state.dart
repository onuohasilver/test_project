import 'package:drotest/view/store/models/item_model.dart';
import 'package:equatable/equatable.dart';

abstract class CatalogSearchState extends Equatable {
  const CatalogSearchState();

  @override
  List<Object> get props => [];
}

class SearchStateEmpty extends CatalogSearchState {}

class SearchStateLoading extends CatalogSearchState {}

class SearchStateSuccess extends CatalogSearchState {
  const SearchStateSuccess(this.items, this.keyword);

  final List<Item> items;
  final String keyword;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class SearchStateError extends CatalogSearchState {
  const SearchStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
