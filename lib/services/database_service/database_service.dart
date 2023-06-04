import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasty_cook/models/user_model.dart';
import 'package:tasty_cook/services/database_service/database_keys.dart';

class DatabaseService {
  late final SharedPreferences prefs;
  final Logger _logger = Logger();

  Future _sharedPreferencesInit() async {
    prefs = await SharedPreferences.getInstance();
  }

  // USER

  Future<void> saveUser(UserModel user) async {
    await _sharedPreferencesInit();

    final String jsonString = json.encode(user.toJson());

    await prefs.setString(DatabaseKeys.user, jsonString);
  }

  Future<UserModel?> getUser() async {
    await _sharedPreferencesInit();

    final String? jsonString = prefs.getString(DatabaseKeys.user);

    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final UserModel user = UserModel.fromJson(jsonMap);
      _logger.i('User retrieved from database: $user');

      return user;
    }

    return null;
  }

  Future<void> cleanUser() async {
    await _sharedPreferencesInit();

    await prefs.remove(DatabaseKeys.user);
  }

  // TOKEN

  Future<void> saveToken(String token) async {
    await _sharedPreferencesInit();

    await prefs.setString(DatabaseKeys.token, token);
  }

  Future<String?> getToken() async {
    await _sharedPreferencesInit();

    final String? token = prefs.getString(DatabaseKeys.token);

    return token;
  }

  Future<void> cleanToken() async {
    await _sharedPreferencesInit();

    await prefs.remove(DatabaseKeys.token);
  }
}