import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/pallete.dart';

class RoundedSmallButton extends StatelessWidget {
  final String title;
  final Color? backColor;
  final Color? fontColor;
  final VoidCallback onTap;

  const RoundedSmallButton({Key? key, required this.title, required this.onTap, this.backColor, this.fontColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Chip(
        labelPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
        label: Text(
          title,
          style: TextStyle(
            fontSize: 18.spMax,
            color:fontColor?? Pallete.backgroundColor
          ),
        ),
        backgroundColor: backColor?? Pallete.whiteColor,
      ),
    );
  }
}
