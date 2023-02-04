import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone/utils/common/loading_indicator.dart';
import 'package:twitter_clone/utils/theme/pallete.dart';

import '../../../utils/common/exports.dart';
import '../../../utils/constants/asset_constants.dart';

class CreateTweetView extends ConsumerStatefulWidget {
  const CreateTweetView({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateTweetView> createState() => _CreateTweetViewState();
}

class _CreateTweetViewState extends ConsumerState<CreateTweetView> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.close, size: 26.spMax, color: Pallete.whiteColor,),
        ),
        actions: [
          RoundedSmallButton(
              title: 'Tweet',
              onTap: (){
                Navigator.pop(context);
              },
            backColor: Pallete.blueColor,
            fontColor: Pallete.whiteColor,
          ),
        ],
      ),
      body: currentUser== null ? const LoadingWidget()
      :SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(currentUser.profilePic),
                    radius: 30.r,
                  ),
                  SizedBox(width: 20.w,),
                  Expanded(
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 20.spMax,
                            fontWeight: FontWeight.w500
                        ),
                        decoration: InputDecoration(
                          hintText: 'What\'s happening now?',
                          hintStyle: TextStyle(
                            fontSize: 20.spMax,
                            fontWeight: FontWeight.w900
                          ),
                          border: InputBorder.none
                        ),
                        maxLines: null,
                      ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Pallete.greyColor,
              width: 0.9.h
            )
          )
        ),
        child: Row(
          children: [
            SvgPicture.asset(AssetsConstants.galleryIcon, color: Pallete.blueColor,),
            SizedBox(width: 20.w,),
            SvgPicture.asset(AssetsConstants.gifIcon, color: Pallete.blueColor,),
            SizedBox(width: 20.w,),
            SvgPicture.asset(AssetsConstants.emojiIcon, color: Pallete.blueColor,)
          ],
        ),
      ),
    );
  }
}
