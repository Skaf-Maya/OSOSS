import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ososs_test/view/screens/home/home_screen.dart';
import 'package:ososs_test/view/screens/page1/page_one_screen.dart';
import 'package:ososs_test/view/screens/page2/page_two_screen.dart';
import '../view/screens/splash/splash_screen.dart';


class RouteHelper {
  static const String splash = '/splash-screen';
  static const String home = '/home-screen';
  static const String pageOne = '/page-one-screen';
  static const String pageTwo = '/page-two-screen';


  static String getSplashScreenRoute() => splash;
  static String getHomeScreenRoute() => home;
  static String getPageOneScreen(String name) {
    return '$pageOne?name=$name';
  }
  static String getPageTwoScreen() => pageTwo;


  static List<GetPage> routes = [
    GetPage(name: splash, page: () => getRoute(const SplashScreen())),
    GetPage(name: home, page: () => getRoute(const HomeScreen())),
    GetPage(name: pageOne, page: () {
      return getRoute(PageOneScreen(name: Get.parameters["name"].toString()));
    }),
    GetPage(name: pageTwo, page: () => getRoute(PageTwoScreen())),
  ];

  static getRoute(Widget navigateTo) => navigateTo;
}
