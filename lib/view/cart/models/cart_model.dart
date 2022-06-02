import 'package:drotest/view/store/models/item_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  const Cart({
    this.items = const <Item>[],
  });

  final List<Item> items;

  int get totalPrice {
    return items.fold(0, (total, current) => total + current.price);
  }

  int numberInCart(String name) {
    return items.where((element) => element.name == name).length;
  }

  int totalPriceOfDrug(String name) {
    return items
        .where((element) => element.name == name)
        .fold(0, (previousValue, element) => previousValue + element.price);
  }

  @override
  List<Object> get props => [items];
}
