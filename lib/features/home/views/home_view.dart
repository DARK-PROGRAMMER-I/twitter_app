import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/features/home/controllers/navigation_controller.dart';
import 'package:twitter_clone/utils/constants/constants.dart';

import '../../../utils/common/exports.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar(),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (int value){
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsConstants.homeFilledIcon)
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsConstants.homeFilledIcon)
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsConstants.homeFilledIcon)
          )
        ],
      ),
    );
  }
}
