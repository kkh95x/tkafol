// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:takafol/src/core/application/colors_manager.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, this.backColor,required this.name,required this.onTap,this.forcColor});
  Color? backColor;
  Color? forcColor;
  String name;
  Function()? onTap;

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey.shade500,offset: Offset(0,3),spreadRadius: 4,blurRadius: 9)],
          borderRadius: BorderRadius.circular(50),
          color: backColor??Colors.white,border: Border.all(color: backColor??AppColor.primaryColor)),
        child: Text(name,style:Theme.of(context).textTheme.titleMedium?.copyWith(color: forcColor??Colors.black,fontSize: 24) ,)),
      ),
    );
  }
}
