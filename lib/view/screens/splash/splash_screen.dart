import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ososs_test/controller/splash_screen_controller.dart';
import 'package:ososs_test/utils/images.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<SplashScreenController>(
          builder: (splashController) {
            return Center(
                child: Container(
                  width: context.width,
                  height: context.height,
                  color: Theme.of(context).colorScheme.background,
                  child: Center(child: Image.asset(Images.flutterLogo)),
                )
            );
          },
        )
    );
  }
}