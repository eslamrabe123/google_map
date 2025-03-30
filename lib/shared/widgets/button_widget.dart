import 'package:flutter/material.dart';

import '../../exports.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final String? fontFamily;
  final double width, height, radius;
  final Widget? child;
  final Gradient? gradient;
  final double? fontSize;
  final FontWeight? fontweight;
  final Alignment? alignment;
  final Color? textColor, buttonColor, borderColor;
  final void Function()? onTap;
  final bool withBorder;

  const ButtonWidget(
      {super.key,
      this.gradient,
      this.title = "OK",
      this.width = double.infinity,
      this.height = 60.0,
      this.onTap,
      this.fontFamily,
      this.child,
      this.fontSize,
      this.fontweight,
      this.alignment,
      this.textColor = Colors.white,
      this.buttonColor,
      this.borderColor,
      this.withBorder = false,
      this.radius = 8.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
                buttonColor ?? context.colorScheme.primary),
            overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
            shadowColor: WidgetStateProperty.all<Color>(Colors.white),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                    side: withBorder
                        ? BorderSide(
                            color: borderColor ?? context.colorScheme.primary)
                        : const BorderSide(color: Colors.transparent)))),
        child: Align(
          alignment: alignment ?? Alignment.center,
          child: child ??
              CustomTextWidget(
                weight: fontweight ?? FontWeight.w400,
                title,
                fontsize: fontSize ?? 16,
                fontFamily: fontFamily ?? FontConstants.fontFamily,
                color: textColor ?? Colors.white,
              ),
        ),
      ),
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.function,
    required this.text,
    this.fontweight,
    this.color,
    this.size,
    this.fontFamily,
  });
  final Function function;
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontweight;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        function();
      },
      child: CustomTextWidget(
        text,
        weight: fontweight ?? FontWeight.w500,
        fontFamily: fontFamily ?? FontConstants.fontFamily,
        fontsize: size ?? 16,
        color: color ?? context.colorScheme.primary,
      ),
    );
  }
}
