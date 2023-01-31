import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twitter_clone/theme/app_theme.dart';
import 'package:twitter_clone/theme/pallete.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const AuthField({Key? key, required this.controller, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 18.spMax
      ),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,

        contentPadding: EdgeInsets.only(left: 25.w, top: 25.h, bottom: 25.h),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Pallete.blueColor
          ),
          borderRadius: BorderRadius.circular(10.r)
        ),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Pallete.blueColor
              ),
              borderRadius: BorderRadius.circular(10.r)
          )
      ),
    );
  }
}
