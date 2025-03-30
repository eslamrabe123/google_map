import 'package:flutter/material.dart';

import '../../exports.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final VoidCallback? onBackPress;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppBarWidget({
    super.key,
    required this.title,
    this.color,
    this.onBackPress,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: CustomTextWidget(
        title,
        color: AppColors.black,
        fontsize: FontSizeManager.s18,
        weight: FontWeightManager.semiBold,
      ),
      elevation: 4,
      leading: leading == null
          ? null
          : InkWell(
              onTap: onBackPress,
              child: leading,
            ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
