import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tme_store/api/models/api_response.dart';

abstract class HttpRequester
{
  Future<ApiResponse<T>> post<T>(String url, Map<String, String> values);
} 

class ApiHttpRequester implements HttpRequester {
  @override
  Future<ApiResponse<T>> post<T>(String url, Map<String, String> values) async {
      var response = await http.post(url, body:values);
      var jsonBody = json.decode(response.body);
      //print(jsonBody);
      return ApiResponse.fromJson<T>(jsonBody);
  }
}
