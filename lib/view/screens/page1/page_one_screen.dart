import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ososs_test/controller/page_one_screen_controller.dart';
import 'package:ososs_test/utils/dimensions.dart';
import 'package:ososs_test/view/screens/page1/widget/shape_widget.dart';

class PageOneScreen extends StatefulWidget {

  String name;
  PageOneScreen({required this.name});

  @override
  State<PageOneScreen> createState() => _PageOneScreenState();
}

class _PageOneScreenState extends State<PageOneScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<PageOneScreenController>().selectedIndex = 0;
    Get.find<PageOneScreenController>().borderRadius = BorderRadius.circular(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: Dimensions.paddingSizeVeryLarge,
        title: const Text("Animations"),
      ),
      body: GetBuilder<PageOneScreenController>(
          builder: (pageOneController) {
            return Column(
              children: [
                const SizedBox(height: Dimensions.paddingSizeVeryExtraLarge),
                Center(
                  child: Text(widget.name.isEmpty ? pageOneController.yourName :
                  widget.name, style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1),
                ),
                const SizedBox(height: Dimensions.paddingSizeVeryExtraLarge),
                Center(
                  child: AnimatedContainer(
                    width: context.width * 0.8,
                    height: context.width * 0.8,
                    decoration: BoxDecoration(
                      color: pageOneController.selectedIndex == 0 ? Theme.of(context).colorScheme.secondary
                          : pageOneController.selectedIndex == 1 ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.tertiary,
                      borderRadius: pageOneController.borderRadius,
                    ),
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.ease
                  ),
                ),
              ],
            );
          },
        ),
      bottomNavigationBar: GetBuilder<PageOneScreenController>(
        builder: (pageOneController) {
          return BottomAppBar(
            elevation: 0,
            height: context.height * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShapeWidget(
                  onTap: () {
                    setState(() {
                      pageOneController.selectedIndex = 0;
                      pageOneController.borderRadius = BorderRadius.circular(0);
                    });
                  },
                  width: 60,
                  height: 60,
                  radius: 0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                ShapeWidget(
                    onTap: () {
                      setState(() {
                        pageOneController.selectedIndex = 1;
                        pageOneController.borderRadius = BorderRadius.circular(30);
                      });
                    },
                    width: 60,
                    height: 60,
                    radius: 10,
                    color: Theme.of(context).primaryColor
                ),
                ShapeWidget(
                  onTap: () {
                    setState(() {
                      pageOneController.selectedIndex = 2;
                      pageOneController.borderRadius = BorderRadius.circular(200);
                    });
                  },
                  width: 60,
                  height: 60,
                  radius: 50,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}