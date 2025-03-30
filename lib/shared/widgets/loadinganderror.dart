import 'package:flutter/material.dart';

import '../../exports.dart';

class LoadingAndError extends StatelessWidget {
  const LoadingAndError(
      {super.key,
      required this.isError,
      required this.isLoading,
      this.function,
      required this.child});
  final bool isError;
  final bool isLoading;
  final Widget child;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (
      context,
    ) {
      if (isError) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(
                'يوجد مشكله فى البيانات',
                fontsize: 18,
                color: context.colorScheme.primary,
              ),
              24.ph,
              if (Navigator.canPop(context) || function != null)
                ButtonWidget(
                    // radius: 20,
                    withBorder: true,
                    width: 150,
                    height: 50,
                    // borderColor: Color(0xffDAF1DE),
                    // buttonColor: Color(0xffDAF1DE),
                    onTap: () async {
                      function != null
                          ? await function!()
                          : Navigator.canPop(context)
                              ? Navigator.pop(context)
                              : null;
                      // Navigator.pop(context);
                    },
                    child: CustomTextWidget(
                      function != null ? "Retry" : "Go back",
                      color: AppColors.white,
                      fontsize: 18,
                      weight: FontWeight.w500,
                    ))
            ],
          ),
        );
      } else if (isLoading) {
        return Material(
          color: context.colorScheme.primary,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return child;
      }
    });
  }
}
