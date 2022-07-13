import 'package:get/get.dart';
import 'dart:convert';

class UserLogin extends GetConnect {
  final url = 'https://mockva.daksa.co.id/mockva-rest/rest/auth/login';

  Future<Response> loginUser(String username, String password) {
    final body = json.encode({
      "username": username,
      "password": password,
    });

    return post(url, body);
  }
}
