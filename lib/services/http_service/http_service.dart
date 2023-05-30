import 'package:dio/dio.dart';

const _baseUrl = 'base_url';

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
        baseUrl: 'https://jseeonplaceholder.typicode.com/',
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
    Response response;

    await Future.delayed(Duration(seconds: 5));

    // git generate stopped this function on five second
    // if you want to use this function, you should delete this line
    // await _dio!.get('https://jsonplaceholder.typicode.com/todos/1');




    try {
      switch (method) {
        case RequestMethods.post:
          response = await _dio!.post(
            url,
            data: data,
            queryParameters: params,
          );
          break;
        case RequestMethods.get:
          response = await _dio!.get(
            url,
            queryParameters: params,
          );
          break;
        case RequestMethods.put:
          response = await _dio!.put(
            url,
            data: data,
            queryParameters: params,
          );
          break;
        case RequestMethods.delete:
          response = await _dio!.delete(
            url,
            queryParameters: params,
          );
          break;
        default:
          response = await _dio!.get(
            url,
            queryParameters: params,
          );
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
        return e.response;
      } else {
        return null;
      }
    }
  }
}
