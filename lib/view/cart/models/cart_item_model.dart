import 'package:drotest/view/store/models/item_model.dart';
import 'package:equatable/equatable.dart';

class CartModelItem extends Equatable {
  final int quantity;
  final Item item;

  const CartModelItem(this.quantity, this.item);

  CartModelItem remove(int value) {
    return CartModelItem(quantity - value, item);
  }

  CartModelItem add(int value) {
    return CartModelItem(quantity + value, item);
  }

  CartModelItem update(int value) {
    return CartModelItem(value, item);
  }

  @override
  List<Object> get props => [quantity, item];
}
