import 'package:flutter/material.dart';

import '../../exports.dart';

class RestartAppDialogWidget extends StatelessWidget {
  const RestartAppDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: context.colorScheme.primary,
        ),
        width: 0.7.sw,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "LocaleKeys.onBoarding_restartAppMessage.tr()",
              style: context.textTheme.titleLarge?.copyWith(
                fontSize: 16.spMin,
                fontWeight: FontWeightManager.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            ButtonWidget(
              height: 32.h,
              width: 120.w,
              onTap: () {
                Restart.restartApp();
              },
              title: "LocaleKeys.onBoarding_restart.tr()",
              fontSize: 14.spMin,
              buttonColor: Colors.white,
              textColor: context.colorScheme.primary,
            )
          ],
        ),
      ),
    );
  }
}
