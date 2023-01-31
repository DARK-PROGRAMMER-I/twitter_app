import 'package:flutter/material.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/auth/view/signup_view.dart';

class Routes {
  static const String login = '/login';
  static const String signup = '/signup';
}

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );

      case Routes.signup:
        return MaterialPageRoute(
          builder: (_) => const SignupView(),
        );



      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title:  const Text(
            'No ROute Found!'
          ),
        ),
        body: const Center(
          child: Text(
            'No route Found'
          ),
        ),
      ),
    );
  }
}