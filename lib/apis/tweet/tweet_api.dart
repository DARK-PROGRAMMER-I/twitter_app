import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/core/providers.dart';
import 'package:twitter_clone/models/tweet_models/tweet_model.dart';
import 'package:twitter_clone/utils/constants/appwrite_constants.dart';

final tweetApiProvider = Provider<TweetApi>((ref) {
  return TweetApi(db: ref.watch(appwriteDatabsesProvider));
});


abstract class ITweetApi{
  FutureEither<Document> shareTweet({required TweetModel tweetModel});
}

class TweetApi implements ITweetApi{
  Databases _db;
  TweetApi({required Databases db}) : _db = db;

  @override
  FutureEither<Document> shareTweet({required TweetModel tweetModel}) async{
    try{
      final document  = await _db.createDocument(
          databaseId: AppwriteConstants.projectId,
          collectionId: AppwriteConstants.tweetCollectionId,
          documentId: ID.unique(),
          data: tweetModel.toMap()
      );
      return Right(document);
    }on AppwriteException catch(error, stactTrace){
      return Left(Failure(error.message.toString(), stactTrace));
    }catch(error, stactTrace){
      return Left(Failure(error.toString(), stactTrace));
    }
  }

}