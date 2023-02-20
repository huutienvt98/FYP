import 'package:flutter/material.dart';
import 'package:food_scanner/core/utils/change_notifier_property.dart';

class BottomNavBarIndex extends ChangeNotifier {
  late final index = Property<int>(0, notifyListeners);

  void setIndex(int i) {
    index.value = i;
  }
}
