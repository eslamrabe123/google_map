import 'package:flutter/material.dart';

import '../../exports.dart';

class SnackDesgin extends StatelessWidget {
  const SnackDesgin({
    super.key,
    required this.state,
    required this.text,
  });
  final SnackState state;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: state == SnackState.success
              ? const Color(0xffEBFBF5)
              : const Color(0xffFBE5E8),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            8.pw,
            Expanded(
              child: CustomTextWidget(
                text,
                align: TextAlign.start,
                fontsize: 14.sp,
                maxLine: 2,
                color: state == SnackState.success
                    ? const Color(0xff2ACE6C)
                    : const Color(0xffFF4141),
              ),
            ),
            Icon(Icons.close,
                color: state == SnackState.success
                    ? const Color(0xff2ACE6C)
                    : const Color(0xffFF4141)),
          ],
        ),
      ),
    );
  }
}
