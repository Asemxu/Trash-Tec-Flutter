import 'package:flutter/material.dart';

class SkeletonBox extends StatelessWidget {
  final double height;
  final double width;
  final double radius;

  const SkeletonBox({
    Key? key,
    this.height = 20,
    this.width = double.infinity,
    this.radius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}