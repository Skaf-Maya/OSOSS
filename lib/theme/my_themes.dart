import 'package:flutter/material.dart';
import 'package:ososs_test/utils/colors.dart';

class MyThemes {

  static lightTheme(BuildContext context) {
    return ThemeData(
        colorScheme: const ColorScheme(
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
          tertiary: AppColors.lightRedColor,
          error: AppColors.redColor,
          onPrimary: AppColors.white,
          onSecondary: AppColors.black,
          surface: AppColors.white,
          onSurface: AppColors.black,
          background: AppColors.white,
          onBackground: AppColors.black,
          onError: AppColors.white,
          brightness: Brightness.light,
          shadow: AppColors.greyColor,

        ),
        scaffoldBackgroundColor: AppColors.white,
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w800,
              color: AppColors.black),
          headline2: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              color: AppColors.black),
          headline3: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w600,
              color: AppColors.black),
          headline4: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.black),
          headline5: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.black),
          headline6: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.black),
          bodyText1: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500),
          // bodyText2 used for Texts :
          bodyText2: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500),
          // subtitle1 used for textField content and hint, ListTile title :
          subtitle1: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          subtitle2: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400),
          button: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          // caption used for textField error text:
          caption: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            minimumSize: const Size(24, 32),
            maximumSize: const Size(1, 64),
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
            textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.black,
          size: 24,
          opacity: 1,
        ),
        appBarTheme: const AppBarTheme(
          color: AppColors.primaryColor,
          titleTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.white
              ),
          iconTheme: IconThemeData(
            color: AppColors.white,
            size: 24,
            opacity: 1,
          ),
        )
    );
  }

}