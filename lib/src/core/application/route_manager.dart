import 'package:flutter/material.dart';
import 'package:takafol/src/core/presention/pages/home/home_page_user_benefactor.dart';
import 'package:takafol/src/core/presention/pages/home/home_page_user_needy.dart';
import 'package:takafol/src/core/presention/pages/splash/splashPage.dart';
import 'package:takafol/src/core/presention/pages/welcome/welcome_page.dart';
import 'package:takafol/src/user_managment/presintation/pages/login_page.dart';
import 'package:takafol/src/user_managment/presintation/pages/profile_page.dart';
import 'package:takafol/src/user_managment/presintation/pages/register_page.dart';

class AppRoutes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String welcomeRoute = "/welcome";
  static const String homeRouteBenefactor = "/homeBenefactor";
  static const String homeRouteNeedy = "/homeNeedy";

  static const String profile = "/profile";
}

class RoutesGenerator {
  static Route<dynamic> getRpute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case AppRoutes.homeRouteNeedy:
        return MaterialPageRoute(builder: (_) => const HomePageNeedy());
      case AppRoutes.homeRouteBenefactor:
        return MaterialPageRoute(builder: (_) => const HomePageBenefactor());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => ProfilePage());
        case AppRoutes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

      default:
        return unDefindRoute();
    }
  }

  static Route<dynamic> unDefindRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("NotFound"),
                centerTitle: true,
              ),
              body: const Center(
                child: Text("404 Not Found"),
              ),
            ));
  }
}
