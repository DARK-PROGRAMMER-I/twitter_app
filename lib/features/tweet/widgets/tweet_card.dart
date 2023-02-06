import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone/models/tweet_models/tweet_model.dart';

import '../../../utils/common/exports.dart';

class TweetCardWidget extends ConsumerWidget {
  final TweetModel tweet;
  const TweetCardWidget({Key? key, required this.tweet}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userDetailsProvider(tweet.uid)).
    when(
        data: (user){
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.profilePic),
                      radius: 30.r,
                    ),

                  ],
                ),
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
