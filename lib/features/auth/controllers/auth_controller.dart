import 'package:appwrite/models.dart' as model;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth/auth_api.dart';
import 'package:twitter_clone/apis/user/user_api.dart';
import 'package:twitter_clone/routes/route_manager.dart';

import '../../../utils/utils.dart';

// StateNotifierProvider
final authControllerProvider = StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
      authApi: ref.watch(authApiProvider),
      userApi: ref.watch(userApiProvider)
  );
});

// Future Provider
final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool>{
  AuthApi _authApi;
  UserApi _userApi;
  AuthController({required AuthApi authApi, required UserApi userApi}) :
        _authApi = authApi,
        _userApi = userApi,
        super(false);


  // Current User
  Future<model.Account?> currentUser(){
    return  _authApi.currentUserAccount();
  }


  // SignUp
  Future<void> signup({
  required String email,
  required String password,
  required BuildContext context,
})async{
    state = true;
    final result = await _authApi.signup(email: email, password: password);
    state = false;
    result.fold(
            (l){
              showSnakBacr(context, l.message);
            },
            (r){

              debugPrint(r.email);
              Navigator.pushNamed(context, Routes.login);
            });
  }


  // Login
  Future<void> login({
  required String email,
  required String password,
  required BuildContext context,
  })async{
    state = true;
    final result  = await _authApi.login(email: email, password: password);
    state = false;
    result.fold(
            (l) {
              showSnakBacr(context, l.message);
            },
            (r) {
            if (kDebugMode) {
              Navigator.pushNamed(context, Routes.home);
            }
            }
    );
  }
}