import 'package:get/get.dart';

class UserLogout extends GetConnect {
  final url = 'https://mockva.daksa.co.id/mockva-rest/rest/auth/logout';

  Future<Response> logoutUser(String sessionId) {
    return delete(
      url,
      headers: {"_sessionId": sessionId},
    );
  }
}
