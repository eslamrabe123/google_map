import 'package:flutter/material.dart';

import '../../exports.dart';

enum TextStyleEnum {
  normal,
  title,
  caption,
}

class CustomTextWidget extends StatelessWidget {
  TextStyle getTextStyle(TextStyleEnum textStyleEnum,
      {Color? color,
      double? fontsize,
      double? height,
      String? fontFamily,
      TextOverflow? overflow,
      TextDecoration? decoration,
      FontWeight? weight}) {
    switch (textStyleEnum) {
      case TextStyleEnum.title:
        return TextStyle(
                fontSize: 25.spMin,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeight.w500)
            .copyWith(
                decoration: decoration,
                color: color ?? AppColors.primary,
                height: height,
                fontWeight: weight,
                fontSize: fontsize,
                overflow: overflow ?? TextOverflow.visible,
                fontFamily: fontFamily ?? FontConstants.fontFamily);
      case TextStyleEnum.caption:
        return TextStyle(
                fontSize: 14.spMin,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeight.w300)
            .copyWith(
                decoration: decoration,
                color: color ?? AppColors.primary,
                fontWeight: weight,
                height: height,
                fontSize: fontsize,
                overflow: overflow ?? TextOverflow.visible,
                fontFamily: fontFamily ?? FontConstants.fontFamily);

      default:
        return TextStyle(
                fontSize: 14.spMin,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeight.w400)
            .copyWith(
                decoration: decoration,
                color: color ?? AppColors.black,
                height: height,
                fontWeight: weight,
                fontSize: fontsize,
                overflow: overflow ?? TextOverflow.visible,
                fontFamily: fontFamily ?? FontConstants.fontFamily);
    }
  }

  const CustomTextWidget(
    this.text, {
    super.key,
    this.textStyleEnum,
    this.color,
    this.fontsize,
    this.weight,
    this.fontFamily,
    this.align,
    this.height,
    this.style,
    this.decoration,
    this.overflow,
    this.maxLine,
  });
  final String text;
  final TextStyleEnum? textStyleEnum;
  final Color? color;
  final double? fontsize;
  final double? height;
  final String? fontFamily;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final TextAlign? align;
  final FontWeight? weight;
  final TextStyle? style;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      maxLines: maxLine,
      style: style ??
          getTextStyle(textStyleEnum ?? TextStyleEnum.normal,
              color: color,
              height: height,
              fontsize: fontsize,
              fontFamily: fontFamily ?? FontConstants.fontFamily,
              overflow: overflow,
              decoration: decoration,
              weight: weight),
    );
  }
}
