import 'dart:async';

import 'package:drotest/utilities/mockdata.dart';
import 'package:drotest/view/cart/models/cart_item_model.dart';

const _delay = Duration(seconds: 4);

const List<Map> _catalog = [...MockData.drugs];
const List<Map> _categories = [...MockData.categories];

class StoreRepository {
  final _items = <CartModelItem>[];

  ///Load the Entire Product Catalog
  Future<List<Map>> loadCatalog() => Future.delayed(_delay, () => _catalog);

  ///Load the Products added into Cart with the specified quantities
  Future<List<CartModelItem>> loadCartItems() =>
      Future.delayed(const Duration(milliseconds: 2), () => _items);

  ///Get the generic Categories for all Products
  Future<List<Map>> loadCategories() =>
      Future.delayed(_delay, () => _categories);

  ///Search through the product catalog and return the list containing partial matches
  Future<List<Map>> search(String keyWord) => Future.delayed(
      _delay,
      () => _catalog
          .where((element) =>
              element['Name'].toLowerCase().contains(keyWord.toLowerCase()))
          .toList());

  ///Search through the product catalog and return the list containing partial matches
  Future<List<Map>> getCategory(String category) => Future.delayed(
      _delay,
      () => _catalog
          .where((element) => element['Category'] == category)
          .toList());

  ///Add Item to Cart by first checking if the item is already in the in the cart
  ///if Item exists, increment it with the parsed quantity
  ///if not add the item to cart as is
  void addItemToCart(CartModelItem item) {
    int index = _getItemIndex(item);
    if (index != -1) {
      _items[index] = _items[index].add(item.quantity);
    } else {
      _items.add(item);
    }
  }

  ///Finds the occurence of an item in the cart and removes it
  void removeItemFromCart(CartModelItem item) {
    int index = _getItemIndex(item);
    if (index != -1) {
      _items.remove(_items[index]);
    }
  }

  ///Finds an item in the list and updates the Item with a new parsed instance
  void updateItem(CartModelItem item) {
    int index = _getItemIndex(item);
    if (index != -1) {
      _items[index] = item;
    }
  }

  ///Gets the Index of the parsed Item
  int _getItemIndex(CartModelItem item) {
    return _items.indexWhere(
      (element) => element.item.name == item.item.name,
    );
  }
}
