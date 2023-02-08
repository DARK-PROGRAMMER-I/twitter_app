import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/tweet/controllers/tweet_controller.dart';
import 'package:twitter_clone/features/tweet/widgets/tweet_card.dart';
import 'package:twitter_clone/models/tweet_models/tweet_model.dart';

import '../../../utils/common/exports.dart';
import '../../../utils/constants/appwrite_constants.dart';

class TweetList extends ConsumerWidget {
  const TweetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(tweetListProvider)
    .when(
        data: (tweetList){
          return ref.watch(getLatestTweetProvider)
            .when(
              data: (latestTweet){
                if(latestTweet.events.contains('databases.*.collections.${AppwriteConstants.tweetCollectionId}.documents.*.create')){
                  tweetList.insert(0, TweetModel.fromMap(latestTweet.payload));
                }else if(latestTweet.events.contains('databases.*.collections.${AppwriteConstants.tweetCollectionId}.documents.*.update')){
                  print(latestTweet.payload['\$id']);
                  int tweetIndex = tweetList.indexWhere((element) => element.tweetId == latestTweet.payload['\$id']);
                  print('Tweet Index: $tweetIndex');
                  tweetList.removeAt(tweetIndex);
                  tweetList.insert(tweetIndex, TweetModel.fromMap(latestTweet.payload));
                }

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
              loading: ()=> ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: tweetList.length,
                  itemBuilder: (BuildContext context, int index){
                    TweetModel tweet = tweetList[index];
                    return TweetCardWidget(tweet: tweet);
                  }
              )
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
