import 'package:drotest/view/store/models/item_model.dart';
import 'package:equatable/equatable.dart';

class Catalog extends Equatable {
  const Catalog({required this.items, this.categories = const []});

  final List<Map> items, categories;

  List<Item> getByName(String name) => [
        ...items
            .where((element) => element['Name'].contains(name))
            .map((e) => Item.fromJson(e))
      ];

  List<Item> allItems() => [...items.map((e) => Item.fromJson(e))];
  List<Map> categoryList() => categories;

  @override
  List<Object> get props => [items];
}
