import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockva_mobile/models/auth/user_login.dart';
import 'package:mockva_mobile/models/services/account_detail.dart';
import 'package:mockva_mobile/views/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final txtUsrC = TextEditingController();
  final txtPassC = TextEditingController();

  late String accNumber;
  late String accName;
  var accBalance = ''.obs;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    txtUsrC.dispose();
    txtPassC.dispose();
    super.dispose();
  }

  Future<void> login(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    UserLogin().loginUser(username, password).then(
      (value) async {
        if (value.statusCode == 200) {
          prefs.setString('sessionId', value.body['id']);
          prefs.setString('accountId', value.body['accountId']);

          await AccountDetail()
              .detailUser(value.body['id'], value.body['accountId'])
              .then((value) {
            accNumber = value.body['id'];
            accName = value.body['name'];
            accBalance.value = value.body['balance'].toString();
          });

          txtUsrC.clear();
          txtPassC.clear();
          Get.off(() => Menu());
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
      },
    );
  }
}
