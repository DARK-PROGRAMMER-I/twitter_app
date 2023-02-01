import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth/auth_api.dart';

import '../../../utils/utils.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authApi: ref.watch(authApiProvider));
});

class AuthController extends StateNotifier<bool>{
  AuthApi _authApi;
  AuthController({required AuthApi authApi}) : _authApi = authApi, super(false);

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
            });
  }

  Future<void> login({
  required String email,
  required String password,
  required BuildContext context,
  })async{
    state = true;
    final result  = await _authApi.login(email: email, password: password);

    result.fold(
            (l) {
              showSnakBacr(context, l.message);
            },
            (r) {
            if (kDebugMode) {
              print(r.userId);
            }
            }
    );
  }
}