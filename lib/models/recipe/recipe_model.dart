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
    required this.imageUrl,
  });

  final int id;
  String title;
  String description;
  int likes;
  final String userId;
  final String? user;
  List<String> categories;
  bool isUserLiked;
  final String? imageUrl;

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
        imageUrl: json['imageUrl'],
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
        'imageUrl': imageUrl,
      };
}
