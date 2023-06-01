class RecipeModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final int likes;
  final bool? isLiked;

  RecipeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.likes,
    this.isLiked,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      likes: json['likes'],
      isLiked: json['isLiked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'likes': likes,
      'isLiked': isLiked,
    };
  }

  
}
