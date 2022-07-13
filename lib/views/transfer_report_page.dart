import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockva_mobile/controllers/transfer_confirm_controller.dart';
import 'package:mockva_mobile/controllers/transfer_inquiry_controller.dart';

class TransferReportPage extends StatelessWidget {
  TransferReportPage({Key? key}) : super(key: key);

  final tfInqC = Get.find<TransferInquiryController>();
  final tfConfC = Get.find<TransferConfirmController>();
  final CurrencyTextInputFormatter _formatter =
      CurrencyTextInputFormatter(symbol: '', decimalDigits: 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Account Source',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            tfInqC.srcAccId,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Account Source Name',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            tfInqC.srcAccName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Account Destination',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            tfInqC.dstAccId,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Account Destination Name',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            tfInqC.dstAccName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Amount',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            _formatter.format(tfInqC.tfAmount.toString()),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Reference Number',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            tfConfC.clientRef,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Transaction Timestamp',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            tfConfC.timeStamp.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Status',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            tfConfC.status,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
