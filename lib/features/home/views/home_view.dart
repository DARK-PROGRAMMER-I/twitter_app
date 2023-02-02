import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/utils/constants/constants.dart';
import 'package:twitter_clone/utils/theme/pallete.dart';
import 'package:twitter_clone/utils/theme/pallete.dart';
import 'package:twitter_clone/utils/theme/pallete.dart';
import 'package:twitter_clone/utils/theme/pallete.dart';
import 'package:twitter_clone/utils/theme/pallete.dart';

import '../../../utils/common/exports.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  updateIndex(int value){
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar(),
      body: IndexedStack(
        index: _currentIndex,
        children: UIConstants.bottomTabPages,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Pallete.backgroundColor,
        onTap: (int value){
          updateIndex(value);
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: _currentIndex == 0 ?
              SvgPicture.asset(AssetsConstants.homeFilledIcon, color: Pallete.whiteColor,):
              SvgPicture.asset(AssetsConstants.homeOutlinedIcon, color: Pallete.whiteColor,)
          ),
          BottomNavigationBarItem(
              icon: _currentIndex == 1 ?
              SvgPicture.asset(AssetsConstants.searchIcon, color: Pallete.whiteColor,):
              SvgPicture.asset(AssetsConstants.searchIcon, color: Pallete.whiteColor,)
          ),
          BottomNavigationBarItem(
              icon: _currentIndex == 2 ?
              SvgPicture.asset(AssetsConstants.notifFilledIcon, color: Pallete.whiteColor,):
              SvgPicture.asset(AssetsConstants.notifOutlinedIcon, color: Pallete.whiteColor,)
          )
        ],
      ),
    );
  }
}
