import 'package:flutter/material.dart';
import 'package:pp/MovieAPP/models/location_models.dart';

class FavoriteItem_Logic extends ChangeNotifier {
  List<LocationModels> _favoriteList = [];
  List<LocationModels> get favoriteList => _favoriteList;

  void addToList(LocationModels item) {
    _favoriteList.add(item);
    notifyListeners();
  }

  void removeFromList(LocationModels item) {
    _favoriteList.remove(item);
    notifyListeners();
  }

  bool isFavorite(LocationModels item) {
    return _favoriteList.contains(item);
  }
}
