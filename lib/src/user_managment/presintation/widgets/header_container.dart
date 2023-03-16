import 'package:flutter/material.dart';
import 'package:takafol/src/core/application/colors_manager.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.size, required this.title});
  final String title;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
        alignment: Alignment.center,
        height: size.height / 4,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColor.primaryColor.withAlpha(150),
          AppColor.primaryColor,
        ], end: Alignment.centerRight, begin: Alignment.centerLeft)),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 40, color: Colors.white),
        ),
      ),
    );
  }
}
