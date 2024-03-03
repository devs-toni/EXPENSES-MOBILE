import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ExpenseApiClient {
  Future<List<dynamic>> getExpenses(String token) async {
    try {
      Response response = await http.get(Uri.http('10.0.2.2:8000', '/expense'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': token
          });
      return jsonDecode(response.body);
    } on HttpException catch (e) {
      return jsonDecode(e.message);
    }
  }
}
