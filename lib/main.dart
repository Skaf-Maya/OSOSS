import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ososs_test/helper/route_helper.dart';
import 'package:ososs_test/theme/my_themes.dart';
import 'package:ososs_test/utils/app_constants.dart';
import 'helper/get_di.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 300));
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      theme: MyThemes.lightTheme(context),
      initialRoute: RouteHelper.getSplashScreenRoute(),
      getPages: RouteHelper.routes,
    );
  }
}