import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_model.dart';

class DBService {
  Future<void> saveUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.56.1:8080/api/user/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toJson()),
      );
      if (response.statusCode != 201) {
        throw Exception("Failed to send data");
      } else {
        print("User Data sent successfully");
      }
    } catch (e) {
      print("Failed to send user data: $e");
    }
  }
}