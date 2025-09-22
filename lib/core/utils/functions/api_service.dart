import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/app_constant.dart';
class ApiService {
  final Dio _dio;
  final baseUrl = AppConstant.baseUrl;
  ApiService(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint?api_key=${AppConstant.apiKey}');
    return response.data;
  }
}