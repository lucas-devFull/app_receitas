import 'package:app_receitas/providers/recipe_provider.dart';
import 'package:app_receitas/views/recipe_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    void searchRecipe() {
      String query = searchController.text;
      recipeProvider.fetchRecipe(query);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(style: TextStyle(color: Colors.white), "CookBook"),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search Recipe and press enter...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onSubmitted: (value) => searchRecipe(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: recipeProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : recipeProvider.allRecipes.isNotEmpty
                      ? ListView.builder(
                          itemCount: recipeProvider.allRecipes.length,
                          itemBuilder: (context, index) {
                            final recipe = recipeProvider.allRecipes[index];
                            return Card(
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                leading: Image.network(
                                  recipe.thumbnail,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(recipe.title),
                                subtitle: Text(recipe.category != ""
                                    ? recipe.category
                                    : "Uncategorized"),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RecipeDetails(recipe: recipe),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        )
                      : const Center(child: Text('No recipes found')),
            ),
          ],
        ),
      ),
    );
  }
}
