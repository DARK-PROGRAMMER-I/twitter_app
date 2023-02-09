import 'package:flutter/material.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/auth/view/signup_view.dart';
import 'package:twitter_clone/features/home/views/home_view.dart';
import 'package:twitter_clone/features/tweet/views/create_tweet_view.dart';
import 'package:twitter_clone/utils/common/loading_indicator.dart';

import '../features/tweet/views/reply_to_tweet_view.dart';

class Routes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String loadingPage = '/loading-page';
  static const String createTweet = '/create-tweet';
  static const String replyTweet = '/reply-tweet';
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

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );

      case Routes.loadingPage:
        return MaterialPageRoute(
          builder: (_) => const LoadingScreen(),
        );

      case Routes.createTweet:
        return MaterialPageRoute(
          builder: (_) => const CreateTweetView(),
        );

      case Routes.replyTweet:
        if(settings.name == Routes.replyTweet){
          var data = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => const ReplyToTweetView(),
          );
        }
        return null;

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
