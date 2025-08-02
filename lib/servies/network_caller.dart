import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final dynamic responseData;
  final String errorMess;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,
    this.errorMess = 'Something went wrong',
  });
}

class NetworkCaller {
  final Logger _logger = Logger();

  Future<NetworkResponse> request({
    required String method, // 'GET', 'POST', etc.
    required String url,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    Uri uri = Uri.parse(url);
    _logRequest(method, url, headers, body);

    try {
      http.Response response;

      switch (method.toUpperCase()) {
        case 'GET':
          response = await http.get(uri, headers: headers).timeout(const Duration(seconds: 10));
          break;
        case 'POST':
          response = await http
              .post(uri, headers: headers ?? {'Content-Type': 'application/json'}, body: jsonEncode(body))
              .timeout(const Duration(seconds: 10));
          break;
        case 'PUT':
          response = await http
              .put(uri, headers: headers ?? {'Content-Type': 'application/json'}, body: jsonEncode(body))
              .timeout(const Duration(seconds: 10));
          break;
        case 'DELETE':
          response = await http
              .delete(uri, headers: headers ?? {'Content-Type': 'application/json'}, body: jsonEncode(body))
              .timeout(const Duration(seconds: 10));
          break;
        default:
          throw UnsupportedError('Unsupported HTTP method: $method');
      }

      _logResponse(url: url, statusCode: response.statusCode, headers: response.headers, body: response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final decoded = jsonDecode(response.body);
        return NetworkResponse(isSuccess: true, statusCode: response.statusCode, responseData: decoded);
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMess: 'Error ${response.statusCode}',
        );
      }
    } on SocketException catch (_) {
      _logError(url, 'No Internet Connection');
      return NetworkResponse(isSuccess: false, statusCode: -1, errorMess: 'No Internet Connection');
    } on FormatException catch (_) {
      _logError(url, 'Invalid JSON format');
      return NetworkResponse(isSuccess: false, statusCode: -1, errorMess: 'Invalid JSON format');
    } catch (e) {
      _logError(url, e.toString());
      return NetworkResponse(isSuccess: false, statusCode: -1, errorMess: e.toString());
    }
  }

  void _logRequest(String method, String url, Map<String, dynamic>? headers, dynamic body) {
    _logger.i('''
🔗 [$method REQUEST]
URL: $url
Headers: ${headers ?? {}}
Body: ${body ?? {}}
''');
  }

  void _logResponse({
    required String url,
    required int statusCode,
    required Map<String, String> headers,
    required String body,
  }) {
    _logger.i('''
✅ [RESPONSE]
URL: $url
Status Code: $statusCode
Headers: $headers
Body: $body
''');
  }

  void _logError(String url, String errorMessage) {
    _logger.e('''
❌ [ERROR]
URL: $url
Message: $errorMessage
''');
  }
}
