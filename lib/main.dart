import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twitter_clone/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone/features/auth/view/signup_view.dart';
import 'package:twitter_clone/routes/route_manager.dart';
import 'package:twitter_clone/utils/common/loading_indicator.dart';
import 'package:twitter_clone/utils/theme/app_theme.dart';
import 'package:twitter_clone/utils/utils.dart';

import 'features/home/views/home_view.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            home: ref.watch(currentUserAccountProvider).when(
                data: (user){
                  if(user != null){
                    return const HomeView();
                  }else{
                    return const SignupView();
                  }
                },
                error: (error, st){
                  showSnakBacr(context, error.toString());
                },
                loading: (){
                  print('Loding roure');
                  return const LoadingScreen();
                }
            ) , //Routes.signup,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        });
  }
}

