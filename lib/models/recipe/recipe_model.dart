class RecipeModel {
  RecipeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.likes,
    required this.userId,
    required this.user,
    required this.categories,
    required this.isUserLiked,
  });

  final int id;
  final String title;
  final String description;
  int likes;
  final String userId;
  final String? user;
  final List<String> categories;
  bool isUserLiked;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        likes: json['likes'],
        userId: json['userId'],
        user: json['user'],
        categories: List<String>.from(json['categories'].map((e) {
          return e;
        })),
        isUserLiked: json['isUserLiked'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'likes': likes,
        'userId': userId,
        'user': user,
        'categories': categories,
        'isUserLiked': isUserLiked,
      };
}
