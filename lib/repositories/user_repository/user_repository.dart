import 'package:dio/dio.dart';
import 'package:tasty_cook/models/user_model.dart';
import 'package:tasty_cook/repositories/user_repository/base_user_repository.dart';
import 'package:tasty_cook/services/http_service/http_service.dart';

class UserRepository extends BaseUserRepository {
  final HttpService _httpService = HttpService();

  @override
  Future<UserModel?> getUser() async {
    final response = await _httpService.request(
        url: 'users/api/user/current', method: RequestMethods.get);

    if (response == null) {
      return null;
    }

    if (response is Response && response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
