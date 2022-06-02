import 'dart:async';

import 'package:drotest/utilities/mockdata.dart';
import 'package:drotest/view/cart/models/cart_item_model.dart';

const _delay = Duration(seconds: 4);

const List<Map> _catalog = [...MockData.drugs];
const List<Map> _categories = [...MockData.categories];

class StoreRepository {
  final _items = <CartModelItem>[];

  Future<List<Map>> loadCatalog() => Future.delayed(_delay, () => _catalog);

  Future<List<CartModelItem>> loadCartItems() =>
      Future.delayed(const Duration(milliseconds: 2), () => _items);

  Future<List<Map>> loadCategories() =>
      Future.delayed(_delay, () => _categories);

  Future<List<Map>> search(String keyWord) => Future.delayed(
      _delay,
      () => _catalog
          .where((element) =>
              element['Name'].toLowerCase().contains(keyWord.toLowerCase()))
          .toList());

  void addItemToCart(CartModelItem item) {
    int index =
        _items.indexWhere((element) => element.item.name == item.item.name);
    if (index != -1) {
      CartModelItem initialItem = _items[index];
      _items[index] =
          CartModelItem(initialItem.quantity + item.quantity, item.item);
    } else {
      _items.add(item);
    }
  }

  void removeItemFromCart(CartModelItem item) {
    int index = _items.indexWhere(
      (element) => element.item.name == item.item.name,
    );
    if (index != -1) {
      _items.remove(_items[index]);
    }
  }

  void updateItem(CartModelItem item) {
    int index = _items.indexWhere(
      (element) => element.item.name == item.item.name,
    );
    if (index != -1) {
      _items[index] = item;
    }
  }

  
}
