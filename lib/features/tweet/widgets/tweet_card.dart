import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/core/enums/tweet_type.dart';
import 'package:twitter_clone/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone/features/tweet/widgets/carusal_slider_widget.dart';
import 'package:twitter_clone/models/tweet_models/tweet_model.dart';
import 'package:twitter_clone/utils/common/styles_manager.dart';

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
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                                Row(
                                  children: [
                                    Text(
                                      user.name,
                                      style: getBoldStyle(color: Pallete.whiteColor, fontSize: 18.spMax),
                                    ),
                                    Text(
                                      ' @${user.name}',
                                      style: getRegularStyle(color: Pallete.greyColor, fontSize: 16.spMax),
                                    ),
                                  ],
                                ),
                                HashTaggedText(text: tweet.text,),
                              ],
                            ),
                        ),
                    )
                  ],
                ),
              ),
              if(tweet.tweetType == TweetType.image)
              CarusalSliderWidget(images: tweet.imageLinks,)
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
