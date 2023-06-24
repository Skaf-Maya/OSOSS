import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ososs_test/utils/dimensions.dart';

class ItemCard extends StatelessWidget {

  final String name;
  final String image;
  ItemCard({required this.name,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.15,
      margin: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(Dimensions.paddingSizeLarge),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.circular(Dimensions.paddingSizeLarge),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.contain
                )
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMedium,vertical: Dimensions.paddingSizeDefault),
              child: Row(
                children: [
                  Text(name,style: Theme.of(context).textTheme.subtitle1)
                ],
              ),
            )
          )
        ],
      )
    );
  }
}
