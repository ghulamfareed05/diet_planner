class Recipe {
  final String id;
  final String name;
  final String source;
  final String imageUrl;
  final int prepTime;
  final String category;
  final int waitTime;
  final int cookTime;
  final int servings;
  final String comments;
  final int calories;
  final int fat;
  final int satFat;
  final int carbs;
  final int fiber;
  final int sugar;
  final int protein;
  final String instructions;
  final List<String> ingredients;
  final List<String> tags;

  Recipe({
    required this.id,
    required this.name,
    required this.source,
    required this.imageUrl,
    required this.prepTime,
    required this.category,
    required this.waitTime,
    required this.cookTime,
    required this.servings,
    required this.comments,
    required this.calories,
    required this.fat,
    required this.satFat,
    required this.carbs,
    required this.fiber,
    required this.sugar,
    required this.protein,
    required this.instructions,
    required this.ingredients,
    required this.tags,
  });

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id'] as String,
      name: map['name'] as String,
      source: map['source'] as String,
      imageUrl: map['imageurl'] as String,
      prepTime: map['preptime'] as int,
      category: map['category'] as String,
      waitTime: map['waittime'] as int,
      cookTime: map['cooktime'] as int,
      servings: map['servings'] as int,
      comments: map['comments'] != null ? map['comments'] as String : "",
      calories: map['calories'] as int,
      fat: map['fat'] as int,
      satFat: map['satfat'] as int,
      carbs: map['carbs'] as int,
      fiber: map['fiber'] as int,
      sugar: map['sugar'] as int,
      protein: map['protein'] as int,
      instructions: map['instructions'] as String,
      ingredients: List<String>.from(map['ingredients'] as List<dynamic>),
      tags: List<String>.from(map['tags'] as List<dynamic>),
    );
  }
}
