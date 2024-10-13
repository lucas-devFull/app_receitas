import 'package:app_receitas/controller/recipe_controller.dart';
import 'package:app_receitas/models/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeProvider with ChangeNotifier {
  final RecipeController _recipeController = RecipeController();

  List<Recipe> _recipes = [];
  List<Recipe> get allRecipes => _recipes;
  bool _isLoading = true;
  bool _hasError = false;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  RecipeProvider() {
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    try {
      _isLoading = true;
      List<Recipe> recipes = await _recipeController.getAllRecipes();
      _recipes = recipes;
      _isLoading = false;
      _hasError = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _hasError = true;
      notifyListeners();
    }
  }
}
