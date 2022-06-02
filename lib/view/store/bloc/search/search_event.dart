import 'package:equatable/equatable.dart';

abstract class CatalogSearchEvent extends Equatable {
  const CatalogSearchEvent();
}

class TextChanged extends CatalogSearchEvent {
  const TextChanged({required this.text});

  final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}
