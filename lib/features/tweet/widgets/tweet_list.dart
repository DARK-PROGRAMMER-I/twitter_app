import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/tweet/controllers/tweet_controller.dart';
import 'package:twitter_clone/features/tweet/widgets/tweet_card.dart';
import 'package:twitter_clone/models/tweet_models/tweet_model.dart';

import '../../../utils/common/exports.dart';

class TweetList extends ConsumerWidget {
  const TweetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(tweetListProvider)
    .when(
        data: (tweetList){
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: tweetList.length,
            itemBuilder: (BuildContext context, int index){
                TweetModel tweet = tweetList[index];
                return TweetCardWidget(tweet: tweet);
              }
          );
        },
        error: (error, stackTrace) {
          print(stackTrace);
         return ErrorrWidget(message: error.toString());
        },
        loading: ()=> const SizedBox.shrink()
    );
  }
}
