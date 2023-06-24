import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ososs_test/controller/page_two_screen_controller.dart';
import 'package:ososs_test/utils/dimensions.dart';
import 'package:ososs_test/view/screens/page2/widget/item_card.dart';

class PageTwoScreen extends StatelessWidget {
  const PageTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: Dimensions.paddingSizeVeryLarge,
          title: const Text('Pokemons'),
        ),
        body: GetBuilder<PageTwoScreenController>(
              builder: (pageTwoController) {
                return pageTwoController.loading.value ?
                const Center(child: CircularProgressIndicator() ):
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge, vertical: Dimensions.paddingSizeMedium),
                  itemCount: pageTwoController.pokemonList!.length,
                  itemBuilder: (context, index) {
                    return ItemCard(
                        name: pageTwoController.pokemonList![index],
                        image: pageTwoController.sprites![index]?.frontShiny != null ?
                        pageTwoController.sprites![index]!.frontShiny! : ""
                    );
                  },
                );
              })
    );
  }
}

