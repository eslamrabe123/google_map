import 'package:flutter/material.dart';

import '../exports.dart';

class BackWidget extends StatelessWidget {
  final VoidCallback? onBack;
  final Color? color;
  final IconData? icon;
  final double? size;
  const BackWidget({super.key, this.onBack, this.color, this.icon, this.size});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (onBack != null) {
            onBack?.call();
          } else {
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon ?? Icons.arrow_back_ios,
            color: color ?? context.colorScheme.primary,
            size: size,
          ),
        ));
  }
}
