import 'package:flutter/material.dart';

import 'package:takafol/src/core/application/colors_manager.dart';
import 'package:takafol/src/core/application/route_manager.dart';
import 'package:takafol/src/core/presention/widgets/custom_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/png/welcome.png",
              width: size.width,
              fit: BoxFit.fill,
            ),
            Text("تطبيق تكافل",style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 34,fontWeight: FontWeight.bold,color: AppColor.primaryColor),),
            Text(
              
              "قال النَّبي -صلى الله عليه وسلم\n (كلُّ امرئٍ في ظِلِّ صدقتِه حتَّى يُقضى بينَ النَّاسِ)",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14,fontWeight: FontWeight.bold,color: AppColor.secondryColor),),
SizedBox(height: 40,),
            CustomButton(
              backColor: AppColor.primaryColor,
              forcColor: Colors.white,
              name: "الأنتقال لصفحة تسجيل الدخول",
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
              },
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
