import 'package:get/get.dart';

class AccountDetail extends GetConnect {
  final url = 'https://mockva.daksa.co.id/mockva-rest/rest/account/detail';

  Future<Response> detailUser(String sessionId, String accountId) {
    return get(
      url,
      headers: {"_sessionId": sessionId},
      query: {"id": accountId},
    );
  }
}
