import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tasty_cook/services/database_service/database_service.dart';

const _baseUrl = 'https://back.tastycook.live/';

// Http request methods: post, get, put, delete, patch
enum RequestMethods { post, get, put, delete, patch }

class HttpService {
  Dio? _dio;

  static Map<String, String> header() => {
        'Content-Type': 'application/json',
      };

  Future<HttpService> init() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: header(),
      ),
    );
    return this;
  }

  Future<dynamic> request({
    required String url,
    required RequestMethods method,
    Map<String, dynamic>? params,
    Map<String, dynamic>? data,
  }) async {
    await init();
    Response response;

    final String token = await DatabaseService().getToken() ?? '';

    final Options options =
        Options(headers: {'Authorization': 'Bearer $token'});

    try {
      switch (method) {
        case RequestMethods.post:
          response = await _dio!.post(
            url,
            data: params,
            options: options,
          );
          Logger().i(response);
          break;
        case RequestMethods.get:
          response = await _dio!.get(
            url,
            queryParameters: params,
            options: options,
          );
          Logger().i(response);
          break;
        case RequestMethods.put:
          response = await _dio!.put(
            url,
            data: params,
            queryParameters: params,
            options: options,
          );
          Logger().i(response);
          break;
        case RequestMethods.delete:
          response = await _dio!.delete(
            url,
            queryParameters: params,
            options: options,
          );
          Logger().i(response);
          break;
        case RequestMethods.patch:
          response = await _dio!.patch(
            url,
            data: params,
            queryParameters: params,
            options: options,
          );
        default:
          response = await _dio!.get(
            url,
            queryParameters: params,
            options: options,
          );
          Logger().i(response);
      }

      if (response.statusCode == 201 ||
          response.statusCode == 200 ||
          response.statusCode == 204) {
        return response;
      } else {
        return null;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Logger().e(e.response!.data);
        return null;
      } else {
        return null;
      }
    }
  }
}
