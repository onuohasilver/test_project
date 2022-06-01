import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String name, type, imageUrl;

  final int price;

  factory Item.fromJson(Map json) {
    return Item(
        imageUrl: json['ImageUrl'],
        price: json['Price'],
        name: json['Name'],
        type: json['Type']);
  }

  const Item(
      {required this.name,
      required this.type,
      required this.imageUrl,
      required this.price});

  @override
  List<Object?> get props => [name, type, imageUrl, price];
}
