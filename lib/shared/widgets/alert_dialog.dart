import 'package:flutter/material.dart';

import '../../exports.dart';

AlertDialog alertDialog(
    Color? backgroundColor,
    AlignmentGeometry? alignment,
    Widget? icon,
    String title,
    Function action1,
    String action1title,
    Function action2,
    String action2title) {
  return AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    backgroundColor: backgroundColor,
    alignment: alignment,
    content: CustomTextWidget(
      title,
      fontsize: 18,
      color: AppColors.black,
      align: TextAlign.center,
    ),
    actions: [
      Card(
          clipBehavior: Clip.hardEdge,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: AppColors.primary, width: 1)),
          child: InkWell(
            onTap: () => action1.call(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: CustomTextWidget(
                action1title,
                textStyleEnum: TextStyleEnum.normal,
                color: AppColors.black,
              ),
            ),
          )),
      Card(
          clipBehavior: Clip.hardEdge,
          elevation: 0,
          color: AppColors.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: AppColors.primary, width: 1)),
          child: InkWell(
            onTap: () {
              action2.call();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: CustomTextWidget(
                action2title,
                textStyleEnum: TextStyleEnum.normal,
                color: Colors.white,
              ),
            ),
          ))
    ],
  );
}
