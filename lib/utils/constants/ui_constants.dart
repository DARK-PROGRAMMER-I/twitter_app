import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/tweet/widgets/tweet_list.dart';
import '../theme/theme.dart';
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

  static List<Widget> bottomTabPages = const [
    TweetList(),
    Text('Search'),
    Text('Notification'),
  ];
}