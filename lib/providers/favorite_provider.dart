import 'package:app_receitas/models/recipe_model.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Recipe> _favoriteRecipes = [];

  List<Recipe> get favoriteRecipes => _favoriteRecipes;

  void addFavoriteRecipe(Recipe recipe) {
    if (!_favoriteRecipes.contains(recipe)) {
      _favoriteRecipes.add(recipe);

      notifyListeners();
    }
  }

  void removeFavoriteRecipe(Recipe recipe) {
    _favoriteRecipes.remove(recipe);
    notifyListeners();
  }

  bool isFavorite(Recipe recipe) {
    return _favoriteRecipes.contains(recipe);
  }
}
