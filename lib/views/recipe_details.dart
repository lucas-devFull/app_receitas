import 'package:app_receitas/models/recipe_model.dart';
import 'package:app_receitas/providers/favorite_provider.dart';
import 'package:app_receitas/views/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    bool isFavorite = favoriteProvider.isFavorite(recipe);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title:
            const Text(style: TextStyle(color: Colors.white), "Recipe details"),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 40, 5, 0),
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: recipe.video != ""
                        ? YouTubeVideoPlayer(videoUrl: recipe.video)
                        : Image.network(
                            height: 300,
                            width: double.infinity,
                            recipe.thumbnail,
                          ),
                  ),
                ),
                Positioned(
                  right: 30,
                  child: IconButton(
                    onPressed: () {
                      if (isFavorite) {
                        favoriteProvider.removeFavoriteRecipe(recipe);
                      } else {
                        favoriteProvider.addFavoriteRecipe(recipe);
                      }
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : null,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              recipe.title,
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 15, 5),
                  child: Text(recipe.instrictions),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
