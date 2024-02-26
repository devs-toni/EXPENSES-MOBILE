import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:expenses/utils/debug.dart';
import 'package:http/http.dart';

class ApiClient {
  Future<String> registerUser(Map<String, dynamic>? userData) async {
    try {
      Response response =
          await http.post(Uri.http('10.0.2.2:8000', '/user'), body: userData);
      return response.body;
    } on HttpException catch (e) {
      return e.message;
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final data = {'email': email, 'password': password};
      LoggerDegub.warning(data.toString());
      Response response = await http.post(
          Uri.http('10.0.2.2:8000', '/user/login'),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      return jsonDecode(response.body);
    } on HttpException catch (e) {
      LoggerDegub.error(e.message);
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

  Future<String> logout() async {
    try {
      Response response = await http.get(
        Uri.http('10.0.2.2:8000' ,'/user/logout'));
      return response.body;
    } on HttpException catch (e) {
      return e.message;
    }
  }
}
