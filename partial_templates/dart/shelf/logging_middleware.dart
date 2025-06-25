import 'package:shelf/shelf.dart';

Middleware logRequests() {
  return (innerHandler) {
    return (Request request) async {
      print('Request: ${request.method} ${request.url}');
      final response = await innerHandler(request);
      print('Response: ${response.statusCode} for ${request.url}');
      return response;
    };
  };
}