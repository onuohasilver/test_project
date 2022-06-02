import 'dart:async';

import 'package:drotest/utilities/mockdata.dart';
import 'package:drotest/view/store/models/item_model.dart';

const _delay = Duration(seconds: 4);

const List<Map> _catalog = [...MockData.drugs];
const List<Map> _categories = [...MockData.categories];

class StoreRepository {
  final _items = <Item>[];

  Future<List<Map>> loadCatalog() => Future.delayed(_delay, () => _catalog);

  Future<List<Item>> loadCartItems() =>
      Future.delayed(const Duration(milliseconds: 2), () => _items);

  Future<List<Map>> loadCategories() =>
      Future.delayed(_delay, () => _categories);

  Future<List<Map>> search(String keyWord) => Future.delayed(
      _delay,
      () => _catalog
          .where((element) =>
              element['Name'].toLowerCase().contains(keyWord.toLowerCase()))
          .toList());

  void addItemToCart(List<Item> item) {
    for (var element in item) {
      _items.remove(element);
    }
  }

  void removeItemFromCart(List<Item> item) {
    for (var element in item) {
      _items.remove(element);
    }
  }
}
