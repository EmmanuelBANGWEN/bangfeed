import 'package:flutter/material.dart';
import '../services/local_db_service.dart';
import '../models/ingredient.dart';

class IngredientProvider with ChangeNotifier {
  final LocalDbService _localDb;
  List<Ingredient> _ingredients = [];
  List<Ingredient> get ingredients => _ingredients;

  IngredientProvider(this._localDb) {
    _loadLocal();
  }

  void _loadLocal() {
    _ingredients = _localDb.getAllIngredients();
    notifyListeners();
  }

  Future<void> addIngredient(Ingredient i) async {
    await _localDb.saveIngredient(i);
    _ingredients.add(i);
    notifyListeners();
  }
}
