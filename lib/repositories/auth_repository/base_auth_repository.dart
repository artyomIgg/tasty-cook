import 'package:tasty_cook/models/anonymous_user.dart';
import 'package:tasty_cook/models/user_model.dart';

abstract class BaseAuthRepository {
  Future<UserModel?> signUpWithEmailAndPassword({
    required AnonymousUser anonymousUser,
  });

  Future<UserModel?> logInWithEmailAndPassword({
    required AnonymousUser anonymousUser,
  });

  Future<UserModel?> logInWithGoogle({required String token});
}
