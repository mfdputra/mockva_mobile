import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mockva_mobile/controllers/transfer_inquiry_controller.dart';

class TransferInquiryPage extends StatelessWidget {
  TransferInquiryPage({Key? key}) : super(key: key);

  final tfInqC = Get.put(TransferInquiryController());
  final CurrencyTextInputFormatter _formatter =
      CurrencyTextInputFormatter(symbol: '', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: tfInqC.txtDstAcc,
            keyboardType: TextInputType.number,
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
            controller: tfInqC.txtAmount,
            inputFormatters: <TextInputFormatter>[_formatter],
            keyboardType: TextInputType.number,
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
              FocusManager.instance.primaryFocus?.unfocus();
              tfInqC.transferInquiry(tfInqC.txtDstAcc.text,
                  tfInqC.txtAmount.text.replaceAll(',', ''));
            },
            child: const Text('Transfer'),
          ),
        ],
      ),
    );
  }
}
