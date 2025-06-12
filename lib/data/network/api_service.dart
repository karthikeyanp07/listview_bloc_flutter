import 'package:dio/dio.dart';

class ApiService
{
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.github.com'));

  Future<List<dynamic>> fetchUsers() async
  {
    final response = await _dio.get('/users');
    return response.data;
  }
}