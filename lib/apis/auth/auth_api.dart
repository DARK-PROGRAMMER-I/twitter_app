import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:twitter_clone/core/providers.dart';

final authApiProvider = Provider<AuthApi>((ref) {
  return AuthApi(
      account: ref.watch(appwriteAccountProvider),
  );
});

abstract class IAuthApi{
  FutureEither<model.Account> signup({
  required String email,
  required String password,
  });
}

class AuthApi implements IAuthApi{
  final Account _account;
  AuthApi({required Account account}) : _account = account;

  @override
  FutureEither<model.Account> signup({
    required String email,
    required String password
  }) async{
    try{
      final account = await  _account.create(
          userId: ID.unique(),
          email: email,
          password: password
      );
      return right(account);
    }on AppwriteException catch(e, stackTrace){
      return left(Failure(e.message.toString(), stackTrace));
    }
  }

}