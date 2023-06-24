import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ososs_test/controller/home_screen_controller.dart';
import 'package:ososs_test/utils/dimensions.dart';
import 'package:ososs_test/view/base/custom_button.dart';
import 'package:ososs_test/view/base/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false ,
        appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Home"),
      ),
      body: GetBuilder<HomeScreenController>(
        builder: (homeController) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: context.width * 0.9,
                    padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeLarge),
                    child: CustomTextField(
                      controller: homeController.nameController,
                      hintText: 'Enter your name',
                      onChanged: (_) {
                        setState(() {
                          homeController.changedText(homeController.yourName);
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                  Center(
                    child: Text(homeController.nameController.text.isEmpty ? homeController.yourName :
                    homeController.nameController.text,style: Theme.of(context).textTheme.subtitle1),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        homeController.nameController.text = "";
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete, color: Theme.of(context).errorColor, size: Dimensions.fontSizeMedium),
                        const SizedBox(width: Dimensions.paddingSizeSmall),
                        Center(
                          child: Text("Clear text",style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Theme.of(context).colorScheme.error
                          )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeMedium),
                  CustomButton(
                    onPressed: () {
                      homeController.goToPageOne(homeController.nameController.text);
                    },
                    text: "Go to page 1",
                    width: context.width * 0.9,
                    height: 45,
                    color: Theme.of(context).colorScheme.secondary,
                    radius: 10,
                  ),
                  const SizedBox(height: Dimensions.paddingSizeMedium),
                  CustomButton(
                    onPressed: () {
                      homeController.goToPageTwo();
                    },
                    text: "Go to page 2",
                    width: context.width * 0.9,
                    height: 45,
                    color: Theme.of(context).colorScheme.primary,
                    radius: 10,
                  ),
                  const SizedBox(height: Dimensions.paddingSizeVeryLarge),
                ],
              ),
            ],
          );
        },
      )
    );
  }
}
