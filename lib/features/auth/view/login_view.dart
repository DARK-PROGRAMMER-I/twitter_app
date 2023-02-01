import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone/features/auth/view/signup_view.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/routes/route_manager.dart';
import 'package:twitter_clone/utils/utils.dart';

import '../../../utils/common/exports.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/theme/theme.dart';


class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final TextEditingController _emailCtr = TextEditingController();
  final TextEditingController _passCtr = TextEditingController();


  @override
  void dispose() {
    _emailCtr.dispose();
    _passCtr.dispose();
    super.dispose();
  }

  void login(){
    if(_emailCtr.text.isNotEmpty && _passCtr.text.isNotEmpty){
      ref.read(authControllerProvider.notifier).
      login(
          email: _emailCtr.text,
          password: _passCtr.text,
          context: context
      );
    }else{
      showSnakBacr(context, 'Fill All Fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    final appbar = UIConstants.appBar();
    return Scaffold(
      appBar: appbar ,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AuthField(
                    controller: _emailCtr,
                  hintText: "Email",
                ),
                SizedBox(
                  height: 20.h,
                ),
                AuthField(
                  hintText: 'Password',
                    controller: _passCtr,
                ),

                SizedBox(height: 40.h,),
                Align(
                  alignment: Alignment.centerRight,
                  child: RoundedSmallButton(
                    title: 'Done',
                    onTap: () {  },
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                RichText(
                    text: TextSpan(
                      text: 'Don\'t have an Account? \ \ ',
                      style: TextStyle(
                        fontSize: 16.spMax,
                        color: Pallete.whiteColor,
                        letterSpacing: 1.1.w
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign-Up',
                          style: TextStyle(fontSize: 16.spMax, color: Pallete.blueColor),
                          recognizer: TapGestureRecognizer()..onTap = (){
                            Navigator.pushNamed(context, Routes.signup);
                          }
                        )
                      ]
                    ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
