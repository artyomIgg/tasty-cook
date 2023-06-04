import 'package:tasty_cook/models/user_model.dart';

abstract class BaseUserRepository {
  Future<UserModel?> getUser();
}