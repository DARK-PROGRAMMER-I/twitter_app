import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/features/home/controllers/navigation_controller.dart';
import 'package:twitter_clone/utils/constants/constants.dart';
import 'package:twitter_clone/utils/theme/pallete.dart';

import '../../../utils/common/exports.dart';

final navigationProvider = StateNotifierProvider<NavigationController, int>((ref) =>NavigationController() );

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: UIConstants.appBar(),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (int value){
          ref.read(navigationProvider.notifier).updateState(value);
        },
        currentIndex: ref.watch(navigationProvider.notifier).state,
        items: [
          BottomNavigationBarItem(
              icon: ref.watch(navigationProvider.notifier).state == 0?
              SvgPicture.asset(AssetsConstants.homeFilledIcon, color: Pallete.whiteColor,):
              SvgPicture.asset(AssetsConstants.homeOutlinedIcon, color: Pallete.whiteColor,)
          ),
          BottomNavigationBarItem(
              icon: ref.watch(navigationProvider.notifier).state == 1?
              SvgPicture.asset(AssetsConstants.searchIcon, color: Pallete.whiteColor,):
              SvgPicture.asset(AssetsConstants.searchIcon, color: Pallete.whiteColor,)
          ),
          BottomNavigationBarItem(
              icon: ref.watch(navigationProvider.notifier).state == 2?
              SvgPicture.asset(AssetsConstants.notifFilledIcon, color: Pallete.whiteColor,):
              SvgPicture.asset(AssetsConstants.notifOutlinedIcon, color: Pallete.whiteColor,)
          )
        ],
      ),
    );
  }
}
