import 'package:get/get.dart';
import 'dart:convert';

class TransferInquiry extends GetConnect {
  final url =
      'https://mockva.daksa.co.id/mockva-rest/rest/account/transaction/transferInquiry';

  Future<Response> reqTransferInquiry(String sessionId, String accountSrcId,
      String accountDstId, String amount) {
    final body = json.encode({
      "accountSrcId": accountSrcId,
      "accountDstId": accountDstId,
      "amount": double.parse(amount),
    });

    return post(url, body, headers: {"_sessionId": sessionId});
  }
}
