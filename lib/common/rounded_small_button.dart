import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/pallete.dart';

class RoundedSmallButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const RoundedSmallButton({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(title, style: TextStyle(fontSize: 18.spMax),),
      backgroundColor: ,
    );
  }
}
