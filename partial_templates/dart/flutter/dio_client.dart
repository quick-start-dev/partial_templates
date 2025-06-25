import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  Dio get instance => _dio;

  // You can add common headers, interceptors, or base URLs here
  DioClient() {
    _dio.options.baseUrl = 'https://api.example.com';
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}