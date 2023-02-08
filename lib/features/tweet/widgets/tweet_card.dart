import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';
import 'package:twitter_clone/core/enums/tweet_type.dart';
import 'package:twitter_clone/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone/features/tweet/controllers/tweet_controller.dart';
import 'package:twitter_clone/features/tweet/widgets/carusal_slider_widget.dart';
import 'package:twitter_clone/features/tweet/widgets/tweet_icon_button.dart';
import 'package:twitter_clone/models/tweet_models/tweet_model.dart';
import 'package:twitter_clone/utils/common/styles_manager.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:twitter_clone/utils/constants/asset_constants.dart';

import '../../../utils/common/exports.dart';
import '../../../utils/theme/pallete.dart';
import 'hash_tagged_text.dart';

class TweetCardWidget extends ConsumerWidget {
  final TweetModel tweet;
  const TweetCardWidget({Key? key, required this.tweet}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userDetailsProvider(tweet.uid)).
    when(
        data: (user){
          final currentUser = ref.watch(currentUserDetailsProvider).value;
          return currentUser == null ? const SizedBox.shrink() :
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.profilePic),
                      radius: 30.r,
                    ),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(left: 20.spMax),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if(tweet.retweetedBy.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(AssetsConstants.retweetIcon,color: Pallete.greyColor, height: 18.h, width: 18.w,),
                                      SizedBox(width: 10.w,),
                                      Text(
                                        're-tweeted by ${tweet.retweetedBy}',
                                        style: getRegularStyle(color: Pallete.greyColor, fontSize: 16.spMax),
                                      ),

                                    ],
                                  ),
                                ),

                                Row(
                                  children: [

                                    Text(
                                      user.name,
                                      style: getBoldStyle(color: Pallete.whiteColor, fontSize: 18.spMax),
                                    ),
                                    SizedBox(width: 5.w,),
                                    Text(
                                      ' @${user.name}',
                                      style: getRegularStyle(color: Pallete.greyColor, fontSize: 16.spMax),
                                    ),
                                    SizedBox(width: 20.w,),
                                    Text(
                                      timeago.format(tweet.tweetAt, locale: 'en_short'),
                                      style: getRegularStyle(color: Pallete.greyColor, fontSize: 16.spMax),
                                    ),


                                  ],
                                ),
                                HashTaggedText(text: tweet.text,),
                                SizedBox(height: 10.h,),
                                if(tweet.link.isNotEmpty &&tweet.link != null )
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r)
                                    ),
                                    child: AnyLinkPreview(
                                        displayDirection: UIDirection.uiDirectionHorizontal,
                                        link: 'https://${tweet.link}'
                                    )),

                                if(tweet.tweetType == TweetType.image)
                                CarusalSliderWidget(images: tweet.imageLinks,),
                                Container(
                                  margin: EdgeInsets.only(top: 20.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TweetIconButton(
                                        onTap: (){},
                                        text: (tweet.commentIds.length + tweet.likes.length + tweet.reshareCount).toString(),
                                        pathName: AssetsConstants.viewsIcon,
                                      ),
                                      TweetIconButton(
                                        onTap: (){},
                                        text: (tweet.commentIds.length).toString(),
                                        pathName: AssetsConstants.commentIcon,
                                      ),
                                      TweetIconButton(
                                        onTap: (){
                                          ref.read(tweetControllerProvider.notifier).reshareTweet(
                                            context: context,
                                            tweetModel: tweet,
                                            userModel: currentUser,
                                          );
                                        },
                                        text: tweet.reshareCount.toString(),
                                        pathName: AssetsConstants.retweetIcon,
                                      ),
                                      LikeButton(
                                        size: 26.spMax,
                                        onTap: (isLiked)async{
                                          ref.read(tweetControllerProvider.notifier).likeTweet(tweet, currentUser);
                                          return !isLiked;
                                        },
                                        bubblesSize: 20,

                                        isLiked: tweet.likes.contains(currentUser.uid),
                                        likeBuilder: (isLiked){
                                          return isLiked ?
                                          SvgPicture.asset(AssetsConstants.likeFilledIcon, color: Pallete.redColor, height: 12,) :
                                          SvgPicture.asset(AssetsConstants.likeOutlinedIcon, color: Pallete.greyColor, height: 12,);
                                        },
                                        likeCount: tweet.likes.length,
                                        countBuilder: (likeCount, isLiked, text ){
                                          return Text(text, style:
                                          isLiked ?
                                          getRegularStyle(color: Pallete.redColor, fontSize: 14.spMax):
                                          getRegularStyle(color: Pallete.whiteColor, fontSize: 14.spMax),);
                                        },
                                      ),
                                      IconButton(
                                          onPressed: (){},
                                          icon: Icon(Icons.share),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                        ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: Pallete.greyColor,
              )
            ],
          );
        },
        error: (error, stackTrace) {
          print(stackTrace);
          return ErrorrWidget(message: error.toString());
        },
        loading: ()=> const LoadingWidget()

    );
  }
}
