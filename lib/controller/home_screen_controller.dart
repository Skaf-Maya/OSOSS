import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ososs_test/helper/route_helper.dart';

class HomeScreenController extends GetxController implements GetxService {

  TextEditingController nameController = TextEditingController();

  String yourName = "Your name";

  changedText(String text) {
    if(nameController.text.isEmpty) {
      return text;
    } else {
      text = nameController.text;
      nameController.value = nameController.value.copyWith(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }
    update();
  }

  goToPageOne(String text) {
    Get.toNamed(RouteHelper.getPageOneScreen(text));
  }

  goToPageTwo() {
    Get.toNamed(RouteHelper.getPageTwoScreen());
  }

}