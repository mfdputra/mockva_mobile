import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockva_mobile/controllers/transfer_confirm_controller.dart';
import 'package:mockva_mobile/controllers/transfer_inquiry_controller.dart';

class TransferConfirmPage extends StatelessWidget {
  TransferConfirmPage({Key? key}) : super(key: key);

  final tfInqC = Get.find<TransferInquiryController>();
  final tfConfC = Get.put(TransferConfirmController());
  final CurrencyTextInputFormatter _formatter =
      CurrencyTextInputFormatter(symbol: '', decimalDigits: 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            initialValue: tfInqC.srcAccId,
            enabled: false,
            decoration: const InputDecoration(
              label: Text(
                'Account Source',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: tfInqC.srcAccName,
            enabled: false,
            decoration: const InputDecoration(
              label: Text(
                'Account Source Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: tfInqC.dstAccId,
            enabled: false,
            decoration: const InputDecoration(
              label: Text(
                'Account Destination',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: tfInqC.dstAccName,
            enabled: false,
            decoration: const InputDecoration(
              label: Text(
                'Account Destination Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: _formatter.format(tfInqC.tfAmount.toString()),
            enabled: false,
            decoration: const InputDecoration(
              label: Text(
                'Amount',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              tfConfC.transferConfirm();
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
