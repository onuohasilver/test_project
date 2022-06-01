import 'dart:async';

import 'package:drotest/utilities/mockdata.dart';
import 'package:drotest/view/store/models/item_model.dart';

const _delay = Duration(seconds: 5);

const List<Map> _catalog = [...MockData.drugs];
const List<Map> _categories = [...MockData.categories];

class StoreRepository {
  final _items = <Item>[];

  Future<List<Map>> loadCatalog() => Future.delayed(_delay, () => _catalog);

  Future<List<Item>> loadCartItems() => Future.delayed(_delay, () => _items);

  Future<List<Map>> loadCategories() =>
      Future.delayed(_delay, () => _categories);

  void addItemToCart(Item item) => _items.add(item);

  void removeItemFromCart(Item item) => _items.remove(item);
}
