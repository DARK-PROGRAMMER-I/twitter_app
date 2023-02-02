import 'package:appwrite/appwrite.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/models/user_models/user_model.dart';
import 'package:twitter_clone/utils/constants/appwrite_constants.dart';

abstract class IUserApi{
  FutureEitherVoid saveUserData({required UserModel userModel});
}

class UserApi implements IUserApi{
  Databases _db;
  UserApi({required Databases db}) : _db = db;

  @override
  FutureEitherVoid saveUserData({required UserModel userModel}) async {
    try{
      await _db.createDocument(
          databaseId: AppwriteConstants.databaseId,
          collectionId: AppwriteConstants.userDatabaseId,
          documentId: ID.unique(),
          data: userModel.toMap()
      );

      return const Right(null);
    }on AppwriteException catch(e, stackTrace){
      Left(Failure(e.message ?? 'Unexpected Error Occurred!', ))
    }catch(e){

    }
  }

}