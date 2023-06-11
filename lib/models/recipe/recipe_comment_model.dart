class RecipeCommentModel {
  final int? id;
  final String commentValue;
  final String? recipeId;
  final String? username;

  RecipeCommentModel({
    this.id,
    required this.commentValue,
    this.recipeId,
    this.username,
  });

  factory RecipeCommentModel.fromJson(Map<String, dynamic> json) {
    return RecipeCommentModel(
      id: json['id'] as int?,
      commentValue: json['commentValue'] as String,
      recipeId: json['recipeId'].toString(),
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'commentValue': commentValue,
      'recipeId': recipeId,
      'username': username,
    };
  }
}
