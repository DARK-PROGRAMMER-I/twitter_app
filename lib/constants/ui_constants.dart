import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'asset_constants.dart';

class UIConstants{
  static AppBar appBar = AppBar(
    title: SvgPicture.asset(AssetsConstants.twitterLogo),
    centerTitle: true,
  );
}