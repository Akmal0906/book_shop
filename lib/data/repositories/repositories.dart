import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepositories {
  static const mainUrl = '';
  var loginUrl = '$mainUrl/dsf/dsf';
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final Dio dio = Dio();

  Future<bool> hasToken() async {
    dynamic value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future persisteToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login(
      String username, String email, String password1, String password2) async {
    Response response = await dio.post(loginUrl, data: {
      "username": username,
      "email": email,
      "password1": password1,
      "password2": password2
    });
    return response.data['token'];
  }
}
