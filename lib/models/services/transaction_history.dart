import 'package:get/get.dart';

class TransactionHistory extends GetConnect {
  final url =
      'https://mockva.daksa.co.id/mockva-rest/rest/account/transaction/log';

  Future<Response> reqHistory(String sessionId, String accountId) {
    return get(
      url,
      headers: {"_sessionId": sessionId},
      query: {"accountSrcId": accountId},
    );
  }
}
