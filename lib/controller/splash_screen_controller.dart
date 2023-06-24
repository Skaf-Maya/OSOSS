import 'dart:async';
import 'package:get/get.dart';
import 'package:ososs_test/helper/route_helper.dart';

class SplashScreenController extends GetxController implements GetxService {

  @override
  void onInit() {
    super.onInit();
    route();
  }

  void route(){
    Timer(const Duration(seconds: 3), () async {
      Get.offAndToNamed(RouteHelper.getHomeScreenRoute());
    });
  }
}