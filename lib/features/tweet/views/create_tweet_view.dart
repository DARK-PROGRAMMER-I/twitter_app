import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone/features/tweet/controllers/tweet_controller.dart';
import 'package:twitter_clone/utils/common/loading_indicator.dart';
import 'package:twitter_clone/utils/theme/pallete.dart';

import '../../../utils/common/exports.dart';
import '../../../utils/constants/asset_constants.dart';
import '../../../utils/utils.dart';
import '../widgets/carousal_images.dart';

class CreateTweetView extends ConsumerStatefulWidget {
  const CreateTweetView({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateTweetView> createState() => _CreateTweetViewState();
}

class _CreateTweetViewState extends ConsumerState<CreateTweetView> {
  TextEditingController _tweetCtr = TextEditingController();

  List<File>? images;
  pickImages()async{
    images = await pickMultipleImages();
    setState(() {});
  }

  shareTweet(){
    final tweetCtr = ref.read(tweetControllerProvider.notifier);
    tweetCtr.shareTweet(images: images ?? [], tweetText: _tweetCtr.text, context: context);
    _tweetCtr.clear();
    images = null;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
    final isLoading = ref.watch(tweetControllerProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.close, size: 26.spMax, color: Pallete.whiteColor,),
        ),
        actions: [
          RoundedSmallButton(
              title: 'Tweet',
              onTap: shareTweet,
            backColor: Pallete.blueColor,
            fontColor: Pallete.whiteColor,
          ),
        ],
      ),
      body:isLoading || currentUser== null ? const LoadingWidget()
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
                        controller: _tweetCtr,
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
              if(images != null)
                CarousalImages(images: images!,)
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
            InkWell(
                onTap: pickImages,
                child: SvgPicture.asset(AssetsConstants.galleryIcon, color: Pallete.blueColor,)),
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
