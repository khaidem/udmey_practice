import 'package:flutter/material.dart';
import 'package:practice_app/Mina_Farid_App/presentation/forgot_password/forget_password.dart';
import 'package:practice_app/Mina_Farid_App/presentation/login/login.dart';
import 'package:practice_app/Mina_Farid_App/presentation/main/main_view.dart';
import 'package:practice_app/Mina_Farid_App/presentation/onbaording/onbaording.dart';
import 'package:practice_app/Mina_Farid_App/presentation/register/register.dart';
import 'package:practice_app/Mina_Farid_App/presentation/resources/string_manager.dart';
import 'package:practice_app/Mina_Farid_App/presentation/splash/splash.dart';
import 'package:practice_app/Mina_Farid_App/presentation/store_details/store_details.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoarding = '/onBoarding';
  static const String loginRoute = '/loginRoute';
  static const String registerRoute = '/registerRoute';
  static const String forgetPasswordRoute = '/forgetPasswordRoute';
  static const String mainRoute = '/mainRoute';
  static const String storeDetails = '/storeDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPassowrd());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetails:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());

      default:
        return unDfineRoute();
    }
  }

  static Route<dynamic> unDfineRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}
