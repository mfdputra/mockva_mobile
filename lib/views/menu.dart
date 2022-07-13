import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockva_mobile/controllers/menu_controller.dart';
import 'package:mockva_mobile/views/account_page.dart';
import 'package:mockva_mobile/views/history_page.dart';
import 'package:mockva_mobile/views/home_page.dart';
import 'package:mockva_mobile/views/transfer_confirm_page.dart';
import 'package:mockva_mobile/views/transfer_inquiry_page.dart';
import 'package:mockva_mobile/views/transfer_report_page.dart';

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);

  final menuC = Get.put(MenuController());

  final pages = [
    HomePage(),
    TransferInquiryPage(),
    const HistoryPage(),
    AccountPage(),
    TransferConfirmPage(),
    TransferReportPage(),
  ];

  final pagesTitle = [
    'Mockva Mobile',
    'Transfer',
    'History',
    'Account',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: menuC.pageIndex.value == 4
              ? AppBar(
                  title: Text(pagesTitle[menuC.selectedMenu.value]),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      menuC.pageIndex.value = 1;
                    },
                  ),
                )
              : AppBar(
                  automaticallyImplyLeading: false,
                  title: Text(pagesTitle[menuC.selectedMenu.value]),
                ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.payments),
                label: 'Transfer',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Account',
              ),
            ],
            currentIndex: menuC.selectedMenu.value,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: menuC.changeSelectedMenu,
          ),
          body: pages[menuC.pageIndex.value],
        ),
      ),
    );
  }
}
