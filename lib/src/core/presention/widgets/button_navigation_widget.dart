import 'package:flutter/material.dart';

import 'package:takafol/src/core/application/colors_manager.dart';

class ButtonNavigationWidget extends StatelessWidget {
  ButtonNavigationWidget(
      {super.key,
      required this.icon,
      required this.isSelected,
      required this.name,
      required this.onTap});
  IconData icon;
  String name;
  bool isSelected;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 100,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color:
                  isSelected ? AppColor.primaryColor : AppColor.primaryColor.withOpacity(0.3),
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isSelected
                        ? AppColor.primaryColor
                        : AppColor.primaryColor.withOpacity(0.3),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
