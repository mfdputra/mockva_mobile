import 'package:get/get.dart';
import 'package:mockva_mobile/models/services/transaction_history.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionHistoryController extends GetxController {
  var data = [].obs;

  Future<void> showHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var sessionId = prefs.getString('sessionId');
    var accountId = prefs.getString('accountId');

    await TransactionHistory().reqHistory(sessionId!, accountId!).then((value) {
      data.value = value.body['data'].reversed.toList();
    });
  }
}
