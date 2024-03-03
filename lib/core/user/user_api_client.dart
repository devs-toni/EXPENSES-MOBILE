import 'dart:convert';
import 'dart:io';
import 'package:expenses/core/user/domain/register_user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserApiClient {
  Future<Map<String, dynamic>> registerUser(RegisterUser userData) async {
    try {
      Response response = await http.post(Uri.http('10.0.2.2:8000', '/user/'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(userData.toJson()));
      return jsonDecode(response.body);
    } on HttpException catch (e) {
      return jsonDecode(e.message);
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final data = {'email': email, 'password': password};

      Response response = await http.post(
          Uri.http('10.0.2.2:8000', '/user/login'),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      return jsonDecode(response.body);
    } on HttpException catch (e) {
      return jsonDecode(e.message);
    }
  }

  Future<String> getUserProfileData() async {
    try {
      Response response =
          await http.get(Uri.http('10.0.2.2:8000', '/user/auth/info'));
      return response.body;
    } on HttpException catch (e) {
      return e.message;
    }
  }

  Future<Map<String, dynamic>> logout(String token) async {
    try {
      Response response = await http.get(
          Uri.http(
            '10.0.2.2:8000',
            '/user/logout',
          ),
          headers: {'Authorization': 'Bearer $token'});
      return jsonDecode(response.body);
    } on HttpException catch (e) {
      return jsonDecode(e.message);
    }
  }
}
