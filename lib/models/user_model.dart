class UserModel {
  final String username;
  final String email;

  const UserModel({
    required this.username,
    required this.email,
  });

  factory UserModel.empty() {
    return const UserModel(
      username: '',
      email: '',
    );
  }

  Map<String, dynamic> toJson() => {
    'username': username,
    'email': email,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
    );
  }
}
