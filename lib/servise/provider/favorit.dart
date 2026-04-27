import 'package:flutter/material.dart';

class FavoritProvider extends ChangeNotifier {
  List<dynamic> favoritList = [];

  void addToFavoritList(Map<String, dynamic> product) {
    favoritList.add(product);
    print(" favoritList is ${favoritList}");
    notifyListeners();
  }

  void removeFromFavoritList(int productId) {
    favoritList.removeWhere((product) => product['id'] == productId);
    print(" favoritList is ${favoritList}");
    print(" favoritList is ${favoritList.length}");
    notifyListeners();
  }

  bool isFound(int productId) {
    return favoritList.any((product) => product['id'] == productId);
  }
}
