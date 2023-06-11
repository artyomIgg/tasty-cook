import 'package:tasty_cook/models/user_model.dart';

abstract class BaseUserRepository {
  Future<UserModel?> getUser();
  Future<bool> changePassword(
      {required String oldPassword, required String newPassword1, required String newPassword2});
}
