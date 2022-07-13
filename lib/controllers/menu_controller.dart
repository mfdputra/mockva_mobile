import 'package:get/get.dart';

class MenuController extends GetxController {
  var selectedMenu = 0.obs;
  var pageIndex = 0.obs;

  void changeSelectedMenu(int index) {
    selectedMenu.value = index;
    pageIndex.value = index;
  }
}
