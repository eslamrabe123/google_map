import 'package:flutter/cupertino.dart';

import '../../exports.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height, width, errorPadding;
  final Color? errorBorderColor;
  final double? borderRadius;

  const CustomNetworkImage(
      {super.key,
      required this.imageUrl,
      this.height,
      this.width,
      this.errorBorderColor,
      this.errorPadding,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height ?? 60.h,
      width: width ?? 60.w,
      imageUrl: imageUrl,
      fit: BoxFit.fill,
      errorWidget: (context, url, error) => Container(
        padding: EdgeInsets.all(errorPadding ?? 4.h),
        decoration: BoxDecoration(
          color: const Color(0xffF5EEF5),
          shape: borderRadius != null ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius ?? 0)
              : null,
          border: Border.all(color: errorBorderColor ?? AppColors.black),
        ),
        //TODO
        // child: Image.asset(Assets.images.appPin.path),
      ),
      placeholder: (context, url) =>
          CupertinoActivityIndicator(radius: 14.r, color: AppColors.primary),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: borderRadius != null ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius ?? 0)
              : null,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
