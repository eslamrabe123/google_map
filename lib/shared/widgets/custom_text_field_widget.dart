import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../exports.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String? hintText, label, errorText;
  final TextInputType type;
  final bool password;
  final bool expanded;
  final Color activeBorderColor, borderColor, backgroundColor, hintColor;
  final bool floatingHint;
  final int? maxLines;
  final int? minLines;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final TextAlign textalign;
  final int? maxLengh;
  final ui.TextDirection? textdirection;
  final EdgeInsetsDirectional? contentPadding;
  final double borderRadius;
  final double? hintSize;
  final Widget? prefixIcon, suffixIcon, suffixWidget, prefixWidget;
  final TextEditingController? controller;
  final InputDecoration? inputDecoration;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final String? Function(String?)? validator;
  final bool? isOutline;
  final bool? enable;
  final bool? readOnly;
  const CustomTextFieldWidget(
      {this.onChanged,
      this.onSaved,
      this.isOutline,
      this.readOnly,
      this.hintSize,
      this.enable,
      this.validator,
      this.onTap,
      this.prefixWidget,
      this.password = false,
      this.expanded = false,
      this.floatingHint = false,
      this.type = TextInputType.text,
      this.hintText = "",
      this.label,
      this.textalign = TextAlign.start,
      this.maxLengh,
      this.errorText,
      this.controller,
      this.activeBorderColor = const Color(0xff8CAAC5),
      this.borderRadius = 8.0,
      this.borderColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.hintColor = const Color(0xffA1A7AD),
      this.maxLines,
      this.minLines = 1,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixWidget,
      this.inputDecoration,
      this.contentPadding,
      this.textdirection,
      super.key,
      this.focusNode});

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool isPass = false;
  @override
  void initState() {
    isPass = widget.password ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: context.colorScheme.primary,
      readOnly: widget.readOnly ?? false,
      enabled: widget.enable ?? true,
      validator: widget.validator,
      maxLength: widget.maxLengh,
      focusNode: widget.focusNode,
      controller: widget.controller,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines,
      textAlign: widget.textalign,
      textDirection: widget.textdirection,
      style: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontFamily: FontConstants.fontFamily,
          fontWeight: FontWeight.w300),
      decoration: widget.inputDecoration ??
          InputDecoration(
              contentPadding: widget.contentPadding,
              filled: true,
              fillColor: widget.backgroundColor,
              prefixIcon: widget.prefixIcon,
              prefix: widget.prefixWidget,
              suffix: widget.suffixWidget,
              suffixIcon: widget.suffixIcon ??
                  (isPass
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isPass = !isPass;
                            });
                          },
                          icon: Icon(
                            widget.password
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off,
                            color: const Color(0xff8CAAC5),
                          ),
                        )
                      : widget.suffixIcon),
              errorText: widget.errorText,
              labelText: widget.label,
              border: borderType(isOutline: widget.isOutline),
              focusedBorder: borderType(isOutline: widget.isOutline),
              enabledBorder: borderType(isOutline: widget.isOutline),
              errorBorder: borderType(isOutline: widget.isOutline),
              labelStyle: const TextStyle(
                color: Color(0xFF8CAAC5),
                fontFamily: FontConstants.fontFamily,
              ),
              hintStyle: TextStyle(
                color: widget.hintColor,
                fontSize: widget.hintSize ?? 14,
                fontWeight: FontWeight.w400,
                fontFamily: FontConstants.fontFamily,
              ),
              hintText: widget.hintText),
      keyboardType: widget.type,
      obscureText: widget.password,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      onTap: () {
        widget.onTap?.call();
      },
    );
  }

  InputBorder borderType({bool? isOutline}) {
    return (isOutline ?? true)
        ? OutlineInputBorder(
            borderSide: BorderSide(color: widget.activeBorderColor, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
          )
        : UnderlineInputBorder(
            borderSide: BorderSide(color: widget.activeBorderColor, width: 1),
            // borderRadius: BorderRadius.all(
            //   Radius.circular(widget.borderRadius),
            // ),
          );
  }
}
