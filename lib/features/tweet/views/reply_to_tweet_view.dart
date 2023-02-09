import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone/features/tweet/widgets/tweet_card.dart';
import 'package:twitter_clone/models/tweet_models/tweet_model.dart';

import '../../../utils/common/exports.dart';

class ReplyToTweetView extends ConsumerStatefulWidget {
  final TweetModel tweetModel;
  const ReplyToTweetView({Key? key, required this.tweetModel}) : super(key: key);

  @override
  ConsumerState<ReplyToTweetView> createState() => _ReplyToTweetViewState();
}

class _ReplyToTweetViewState extends ConsumerState<ReplyToTweetView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reply to Tweet'),
      ),
      body: ref.watch(userDetailsProvider(widget.tweetModel.uid)).when(
          data: (user){
            return Column(
              children: [
                TweetCardWidget(tweet: widget.tweetModel)
              ],
            );
          },
          error: (error, stackTrace) {
            print(stackTrace);
            return ErrorrWidget(message: error.toString());
          },
          loading: ()=> const LoadingWidget()
      )
    );
  }
}
