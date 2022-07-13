import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockva_mobile/controllers/logout_controller.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  final logutC = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            logutC.logout();
          },
          child: const Text('Logout')),
    );
  }
}
