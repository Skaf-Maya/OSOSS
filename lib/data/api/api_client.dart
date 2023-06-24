import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:ososs_test/data/model/error_response.dart';

class ApiClient extends GetxService {
  final String appBaseUrl;
  final String noInternetMessage = 'Connection to api server failed';
  final int timeoutInSeconds = 30;

  Map<String, String>? _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    updateHeader();
  }

  void updateHeader() {
    Map<String, String> _header = {};
    _header.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
    });
    _mainHeaders = _header;
  }

  Future<Response> getData(String uri, {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      http.Response response = await http.get(
        Uri.parse(appBaseUrl+uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      // print('------------${e.toString()}');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Response handleResponse(http.Response response, String uri) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    }catch(e) {}
    Response _response = Response(
      body: _body ?? response.body, bodyString: response.body.toString(),
      request: Request(headers: response.request!.headers, method: response.request!.method, url: response.request!.url),
      headers: response.headers, statusCode: response.statusCode, statusText: response.reasonPhrase,
    );
    if(_response.statusCode != 200 && _response.body != null && _response.body is !String) {
      if(_response.body.toString().startsWith('{errors: [{code:')) {
        ErrorResponse errorResponse = ErrorResponse.fromJson(_response.body);
        _response = Response(statusCode: _response.statusCode, body: _response.body, statusText: errorResponse.errors[0].message);
      }else if(_response.body.toString().startsWith('{message')) {
        _response = Response(statusCode: _response.statusCode, body: _response.body, statusText: _response.body['message']);
      }
    }else if(_response.statusCode != 200 && _response.body == null) {
      _response = Response(statusCode: 0, statusText: noInternetMessage);
    }
    return _response;
  }
}