import 'package:drotest/view/cart/models/cart_item_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  const Cart({this.items = const <CartModelItem>[]});

  final List<CartModelItem> items;

  int get totalPrice {
    return items.fold(
        0, (total, current) => total + current.item.price * current.quantity);
  }

  CartModelItem getByName(String name) {
    return items.firstWhere((element) => element.item.name == name);
  }

  @override
  List<Object> get props => [items];
}
