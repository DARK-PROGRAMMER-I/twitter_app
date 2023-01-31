import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/theme/pallete.dart';

import 'asset_constants.dart';

class UIConstants{
  static AppBar appBar (){
    return AppBar(
      title: SvgPicture.asset(
          AssetsConstants.twitterLogo,
        color: Pallete.blueColor,
        height: 40.h,
      ),
      centerTitle: true,
    );
  }
}