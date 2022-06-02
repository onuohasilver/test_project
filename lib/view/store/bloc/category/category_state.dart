import 'package:drotest/view/store/models/item_model.dart';
import 'package:equatable/equatable.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryStateEmpty extends CategoryState {}

class CategoryStateLoading extends CategoryState {}

class CategoryStateSuccess extends CategoryState {
  const CategoryStateSuccess(this.items, this.keyword);

  final List<Item> items;
  final String keyword;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'CategoryStateSuccess { items: ${items.length} }';
}

class CategoryStateError extends CategoryState {
  const CategoryStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
