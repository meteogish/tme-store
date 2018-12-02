import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tme_store/api/models/api_response.dart';

abstract class HttpRequester
{
  Future<ApiResponse<T>> post<T>(String url, Map<String, dynamic> values);
} 

class ApiHttpRequester implements HttpRequester {
  @override
  Future<ApiResponse<T>> post<T>(String url, Map<String, dynamic> values) async {
    try {
      var response = await http.post(url, body:values);
      var jsonBody = json.decode(response.body);
      return ApiResponse.fromJson<T>(jsonBody);
    }
    catch(Exception)
    {
      return null;
    }
  }
}
