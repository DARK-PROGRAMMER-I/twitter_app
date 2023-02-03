import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/core/providers.dart';
import 'package:twitter_clone/models/user_models/user_model.dart';
import 'package:twitter_clone/utils/constants/appwrite_constants.dart';


final userApiProvider = Provider<UserApi>((ref) {
  return UserApi(db: ref.watch(appwriteDatabsesProvider));
});


abstract class IUserApi{
  FutureEitherVoid saveUserData({required UserModel userModel});
  Future<model.Document> getUserData(String uid);
}

class UserApi implements IUserApi{
  Databases _db;
  UserApi({required Databases db}) : _db = db;

  @override
  FutureEitherVoid saveUserData({required UserModel userModel}) async {
    try{
      print(userModel.uid);
      await _db.createDocument(
          databaseId: AppwriteConstants.databaseId,
          collectionId: AppwriteConstants.userCollectionId,
          documentId: userModel.uid,
          data: userModel.toMap()
      );

      return const Right(null);
    }on AppwriteException catch(e, stackTrace){
      return Left(Failure(e.message ?? 'Unexpected Error Occurred!', stackTrace));
    }catch(e, stackTrace){
      return Left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<model.Document> getUserData(String uid) {
    return _db.getDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.userCollectionId,
        documentId: uid
    );
  }

}