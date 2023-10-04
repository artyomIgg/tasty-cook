import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tasty_cook/models/anonymous_user.dart';
import 'package:tasty_cook/repositories/auth_repository/base_auth_repository.dart';
import 'package:tasty_cook/services/http_service/http_service.dart';

class AuthRepository extends BaseAuthRepository {
  final HttpService _httpService = HttpService();

  @override
  Future<String?> logInWithEmailAndPassword(
      {required AnonymousUser anonymousUser}) async {
    await _httpService.init();

    final response = await _httpService.request(
      url: 'users/api/user/login',
      method: RequestMethods.post,
      data: anonymousUser.toJson(),
    );

    if (response == null) {
      return null;
    }

    if (response is Response && response.statusCode == 200) {
      return response.data['token'];
    } else {
      return null;
    }
  }

  @override
  Future<String?> logInWithGoogle({required String token}) async {
    await _httpService.init();

    final response = await _httpService.request(
        url: 'users/api/user/google-authenticate',
        method: RequestMethods.post,
        data: {
          'IdToken': token,
        });

    if (response == null) {
      throw Exception('Login failed');
    }

    if (response is Response) {
      return response.data['authToken'];
    } else {
      return null;
    }
  }

  @override
  Future<bool> signUpWithEmailAndPassword(
      {required AnonymousUser anonymousUser}) async {
    await _httpService.init();

    final response = await _httpService.request(
      url: 'users/api/user/register',
      method: RequestMethods.post,
      data: anonymousUser.toJson(),
    );

    Logger().d(response);

    if (response is Response && response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
