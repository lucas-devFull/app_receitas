class Recipe {
  final String id;
  final String title;
  final String thumbnail;
  final String category;
  final String instrictions;
  final String video;
  Recipe({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.category,
    required this.instrictions,
    required this.video,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['idMeal'],
      title: json['strMeal'],
      thumbnail: json['strMealThumb'],
      category: json['strCategory'],
      instrictions: json['strInstructions'],
      video: json['strYoutube'],
    );
  }
}
