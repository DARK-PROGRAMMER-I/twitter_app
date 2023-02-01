import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/utils/utils.dart';

import '../../../routes/route_manager.dart';
import '../../../utils/common/exports.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/theme/theme.dart';

class SignupView extends ConsumerStatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  ConsumerState<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {
  final TextEditingController _emailCtr = TextEditingController();
  final TextEditingController _passCtr = TextEditingController();

  void signUp(){
    if(_emailCtr.text.isNotEmpty && _passCtr.text.isNotEmpty){
      ref.read(authControllerProvider.notifier).
      signup(
          email: _emailCtr.text,
          password: _passCtr.text,
          context: context
      );
    }else{
      showSnakBacr(context, 'Fill All Fields');
    }

  }

  @override
  void dispose() {
    _emailCtr.dispose();
    _passCtr.dispose();
    super.dispose();
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
                      onTap: signUp,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Already have an Account? \ \ ',
                        style: TextStyle(
                            fontSize: 16.spMax,
                            color: Pallete.whiteColor,
                            letterSpacing: 1.1.w
                        ),
                        children: [
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(fontSize: 16.spMax, color: Pallete.blueColor),
                              recognizer: TapGestureRecognizer()..onTap = (){
                                Navigator.pushNamed(context, Routes.login);
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
