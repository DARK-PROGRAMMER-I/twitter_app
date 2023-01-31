import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/pallete.dart';

class RoundedSmallButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const RoundedSmallButton({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 100.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
          color: Pallete.blueColor,
        ),
        child: Text(title, style: TextStyle(fontSize: 16.spMax),),
      ),
    );
  }
}
