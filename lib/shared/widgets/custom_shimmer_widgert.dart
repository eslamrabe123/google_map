import 'package:flutter/material.dart';

import '../../exports.dart';

class CustomShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final ShapeBorder shapeBorder;

  const CustomShimmerWidget.rectangle({
    super.key,
    required this.height,
    this.width = double.infinity,
    this.shapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    ),
  });
  const CustomShimmerWidget.circle({
    super.key,
    required this.height,
    this.width = double.infinity,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.onSecondary,
      highlightColor: context.colorScheme.onSecondary.withOpacity(.5),
      child: Container(
        height: height,
        width: width,
        decoration: ShapeDecoration(
          shape: shapeBorder,
          color: AppColors.gery,
        ),
      ),
    );
  }
}
