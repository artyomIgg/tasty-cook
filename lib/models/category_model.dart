import 'package:tasty_cook/models/recipe/recipe_model.dart';

class CategoryModel {
  final int id;
  final String name;
  final List<RecipeModel> recipes;

  CategoryModel({
    required this.id,
    required this.name,
    required this.recipes,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      recipes: List<RecipeModel>.from(json['recipes'].map((e) {
        return RecipeModel.fromJson(e);
      })),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'recipes': recipes.map((e) => e.toJson()).toList(),
    };
  }
}
