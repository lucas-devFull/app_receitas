import 'package:app_receitas/providers/favorite_provider.dart';
import 'package:app_receitas/views/recipe_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            style: TextStyle(color: Colors.white), "Favorite Recipe"),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: favoriteProvider.favoriteRecipes.length,
          itemBuilder: (BuildContext context, int index) {
            final recipe = favoriteProvider.favoriteRecipes[index];

            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RecipeDetails(
                      recipe: recipe,
                    ),
                  ),
                );
              },
              child: ListTile(
                leading: Image.network(recipe.thumbnail),
                title: Text(recipe.title),
                contentPadding: const EdgeInsets.all(5),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            );
          }),
    );
  }
}
