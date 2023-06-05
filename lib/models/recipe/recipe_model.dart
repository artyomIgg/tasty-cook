import 'package:tasty_cook/models/category_model.dart';

class RecipeModel {
  RecipeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.likes,
    required this.userId,
    required this.user,
    required this.categories,
  });

  final int id;
  final String name;
  final String description;
  final int likes;
  final String userId;
  final String? user;
  final List<CategoryModel> categories;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        likes: json['likes'],
        userId: json['userId'],
        user: json['user'],
        categories: List<CategoryModel>.from(json['categories'].map((e) {
          return CategoryModel.fromJson(e);
        })),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'likes': likes,
        'userId': userId,
        'user': user,
        'categories': categories,
      };
}
