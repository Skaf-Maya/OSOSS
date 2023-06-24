import 'package:flutter/material.dart';

class ShapeWidget extends StatelessWidget {

  final VoidCallback onTap;
  final double width;
  final double height;
  final Color color;
  final double radius;

  ShapeWidget({
    required this.onTap,
    required this.width,
    required this.height,
    required this.color,
    required this.radius
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius)
        ),
      ),
    );
  }
}
