import 'package:dio/dio.dart';
import 'package:tasty_cook/models/anonymous_user.dart';
import 'package:tasty_cook/models/user_model.dart';
import 'package:tasty_cook/repositories/auth_repository/base_auth_repository.dart';
import 'package:tasty_cook/services/http_service/http_service.dart';

class AuthRepository extends BaseAuthRepository {
  final HttpService _httpService = HttpService();

  @override
  Future<UserModel?> logInWithEmailAndPassword(
      {required AnonymousUser anonymousUser}) async {
    await _httpService.init();

    final response = await _httpService.request(
      url: 'user/login',
      method: RequestMethods.post,
      params: anonymousUser.toJson(),
    );

    if (response == null) {
      return null;
    }

    if (response is Response) {
      return UserModel.fromJson(response.data['user']);
    } else {
      return null;
    }
  }

  @override
  Future<UserModel?> logInWithGoogle({required String token}) async {
    await _httpService.init();

    final response = await _httpService
        .request(url: 'user/register', method: RequestMethods.post, params: {
      'token': token,
    });

    if (response == null) {
      throw Exception('Login failed');
    }

    if (response is Response) {
      return UserModel.fromJson(response.data['user']);
    } else {
      return null;
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword(
      {required AnonymousUser anonymousUser}) async {
    await _httpService.init();

    final response = await _httpService.request(
      url: 'user/google-authenticate',
      method: RequestMethods.post,
      params: anonymousUser.toJson(),
    );

    if (response == null) {
      throw Exception('Login failed');
    }

    if (response is Response) {
      return UserModel.fromJson(response.data['user']);
    } else {
      throw Exception('Login failed');
    }
  }
}
