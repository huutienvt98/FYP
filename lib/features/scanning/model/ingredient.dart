import 'dart:collection';

import 'package:flutter/cupertino.dart';

class IngredientListModel extends ChangeNotifier {
  final List<Ingredient> _ingredients = [];

  UnmodifiableListView<Ingredient> get ingredients => UnmodifiableListView(_ingredients);

  void scan() {
    _ingredients.clear();
    _ingredients.addAll([Ingredient("Chicken"), Ingredient("Leek"), Ingredient("Egg"), Ingredient("Rice")]);
    notifyListeners();
  }

  void edit(int index, String name) {
    _ingredients[index] = Ingredient(name);
    notifyListeners();
  }

  void removeAtIndex(int index) {
    _ingredients.removeAt(index);
    notifyListeners();
  }
}

class Ingredient {
  final String name;

  Ingredient(this.name);
}
