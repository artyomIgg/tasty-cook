class CreateRecipeModel {
  CreateRecipeModel({
    required this.title,
    required this.description,
    required this.categories,
  });

  final String title;
  final String description;
  final List<String> categories;

  factory CreateRecipeModel.fromJson(Map<String, dynamic> json) =>
      CreateRecipeModel(
        title: json['title'],
        description: json['description'],
        categories: List<String>.from(json['categories'].map((e) => e)),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'categories': categories,
      };
}
