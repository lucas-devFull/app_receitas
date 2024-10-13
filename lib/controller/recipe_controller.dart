import 'dart:convert';

import 'package:app_receitas/models/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeController {
  String baseUrl = "https://www.themealdb.com/api/json/v1/1/search.php?s=";

  Future<List<Recipe>> getAllRecipes() async {
    final response = await http.get(Uri.parse(baseUrl));
    List<dynamic> jsonData = json.decode(response.body)['meals'];

    return jsonData.map((recipe) => Recipe.fromJson(recipe)).toList();
  }
}
