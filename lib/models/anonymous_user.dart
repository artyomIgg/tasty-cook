class AnonymousUser {
  final String? username;
  final String email;
  final String password;

  const AnonymousUser({
    this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'email': email,
    'Password': password,
  };

  factory AnonymousUser.fromJson(Map<String, dynamic> json) {
    return AnonymousUser(
      username: json['username'],
      email: json['email'],
      password: json['Password'],
    );
  }
}