import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twitter_clone/constants/ui_constants.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/theme/pallete.dart';

import '../../../common/rounded_small_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailCtr = TextEditingController();
  final TextEditingController _passCtr = TextEditingController();


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
                    onTap: () {  },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                RichText(
                    text: TextSpan(
                      text: 'Already have an Account? \ \ ',
                      style: TextStyle(fontSize: 16.spMax, color: Pallete.whiteColor),
                      children: [
                        TextSpan(
                          text: 'Sign-Up',
                          style: TextStyle(fontSize: 16.spMax, color: Pallete.blueColor),
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
