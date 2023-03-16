import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:takafol/src/core/application/route_manager.dart';
import 'package:takafol/src/core/application/shired_prf/shared_preference.dart';
import 'package:takafol/src/user_managment/domain/app_user_model.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  Future? splashMinit;
  @override
  @override
  void initState() {
    super.initState();
    splashMinit = Future.delayed(
      const Duration(seconds: 1),
      () async {
        AppUser? appUser = await UserSharedPreference.getLocalUser();

        if (mounted) {
          if (appUser == null) {
            Navigator.pushReplacementNamed(context, AppRoutes.welcomeRoute);
          } else if (appUser.typeUser ==
              TypeUser.benefactor.getStringNameTypeUser()) {
            Navigator.pushReplacementNamed(
                context, AppRoutes.homeRouteBenefactor);
          } else if (appUser.typeUser ==
              TypeUser.needy.getStringNameTypeUser()) {
            Navigator.pushReplacementNamed(context, AppRoutes.homeRouteNeedy);
          }
          else{
             Navigator.pushReplacementNamed(context, AppRoutes.welcomeRoute);

          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset("assets/png/logo.png")]),
      ),
    );
  }
}
