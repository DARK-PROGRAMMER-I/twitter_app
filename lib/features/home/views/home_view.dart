import 'package:flutter/cupertino.dart';
import 'package:twitter_clone/utils/constants/constants.dart';

import '../../../utils/common/exports.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar(),
      bottomNavigationBar: CupertinoTabBar(
        items: [

        ],
      ),
    );
  }
}
