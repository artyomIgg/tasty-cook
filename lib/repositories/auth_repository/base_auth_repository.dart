import 'package:tasty_cook/models/anonymous_user.dart';

abstract class BaseAuthRepository {
  Future<bool> signUpWithEmailAndPassword({
    required AnonymousUser anonymousUser,
  });

  Future<String?> logInWithEmailAndPassword({
    required AnonymousUser anonymousUser,
  });

  Future<String?> logInWithGoogle({required String token});
}
