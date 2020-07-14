import 'package:dio/dio.dart';
import 'package:flutterapp2/http/api.dart';

class HttpManager {
  Dio _dio;
  static HttpManager _instance;

  factory HttpManager.getInstance() {
    if (null == _instance) {
      _instance = HttpManager._internal();
    }
    return _instance;
  }

  HttpManager._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: Api.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio = Dio(options);
  }

  request(url, {String method = "get"}) async {
    try {
      Options options = Options(method: method);
      Response response = await _dio.request(url, options: options);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
