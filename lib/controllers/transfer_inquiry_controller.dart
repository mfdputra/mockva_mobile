import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockva_mobile/controllers/menu_controller.dart';
import 'package:mockva_mobile/models/services/transfer_inquiry.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransferInquiryController extends GetxController {
  final txtDstAcc = TextEditingController();
  final txtAmount = TextEditingController();

  late String inquiryId;
  late String srcAccId;
  late String srcAccName;
  late String dstAccId;
  late String dstAccName;
  late double tfAmount;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    txtDstAcc.dispose();
    txtAmount.dispose();
    super.dispose();
  }

  Future<void> transferInquiry(String dstAcc, String amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var sessionId = prefs.getString('sessionId');
    var srcAcc = prefs.getString('accountId');

    if (txtAmount.text.isNotEmpty) {
      TransferInquiry()
          .reqTransferInquiry(sessionId!, srcAcc!, dstAcc, amount)
          .then((value) async {
        if (value.statusCode == 200) {
          inquiryId = await value.body['inquiryId'];
          srcAccId = await value.body['accountSrcId'];
          srcAccName = await value.body['accountSrcName'];
          dstAccId = await value.body['accountDstId'];
          dstAccName = await value.body['accountDstName'];
          tfAmount = await value.body['amount'];

          Get.find<MenuController>().pageIndex.value = 4;

          txtDstAcc.clear();
          txtAmount.clear();
        } else {
          Get.defaultDialog(
            title: 'Error',
            content: Text(value.body),
            confirm: ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text('OK'),
            ),
          );
        }
      });
    } else {
      Get.defaultDialog(
        title: 'Error',
        content: const Text('Invalid form'),
        confirm: ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text('OK'),
        ),
      );
    }
  }
}
