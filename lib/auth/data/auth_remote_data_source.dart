import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRemoteDataSource {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://wedding.playroomzone.pro/api/',
    headers: {'Accept': 'application/json'},
  ));

  Future<void> register(String name, String email, String password) async {
    await dio.post('register', data: {
      'email': email,
      'password': password,
      'name': name,
    });
  }

  Future<void> login(String email, String password) async {
    final response = await dio.post('login', data: {
      'email': email,
      'password': password,
    });

    final token = response.data['token'];
    if (token != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
    } else {
      throw Exception('Token not found in response');
    }
  }
}
