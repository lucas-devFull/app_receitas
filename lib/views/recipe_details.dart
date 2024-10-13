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
          Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(5, 40, 5, 15),
                  child: SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: recipe.video != ""
                          ? YouTubeVideoPlayer(videoUrl: recipe.video)
                          : Image.network(
                              height: 300,
                              width: double.infinity,
                              recipe.thumbnail,
                            ))),
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
          Container(
            color: const Color.fromARGB(255, 45, 45, 45),
            child: Text(
              recipe.title,
            ),
          ),
        ],
      ),
    );
  }
}
