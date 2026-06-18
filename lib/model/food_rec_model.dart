class FoodRecModel {
  final String title;
  final String description;
  final List<String> ingredients;

  FoodRecModel({
    required this.title,
    required this.description,
    required this.ingredients,
  });

  



  factory FoodRecModel.fromJson(Map<String, dynamic> json) {
    return FoodRecModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      ingredients: List<String>.from(json['ingredients'] ?? []),
    );
  }
}
