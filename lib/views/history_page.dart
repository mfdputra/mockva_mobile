import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockva_mobile/controllers/transaction_history_controller.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final trxHisC = Get.put(TransactionHistoryController());
  final CurrencyTextInputFormatter _formatter =
      CurrencyTextInputFormatter(symbol: '', decimalDigits: 1);
  @override
  void initState() {
    trxHisC.showHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: trxHisC.data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Card(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Date : ${trxHisC.data[index]['transactionTimestamp']}',
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Amount : ${_formatter.format(trxHisC.data[index]['amount'].toString())}',
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Ref : ${trxHisC.data[index]['clientRef']}',
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Destination : ${trxHisC.data[index]['accountDstId']}',
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
