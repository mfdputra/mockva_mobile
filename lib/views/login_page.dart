import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockva_mobile/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Mockva Mobile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: loginC.txtUsrC,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: loginC.txtPassC,
              obscureText: true,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                loginC.login(loginC.txtUsrC.text, loginC.txtPassC.text);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
