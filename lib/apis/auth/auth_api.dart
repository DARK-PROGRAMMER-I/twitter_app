import 'package:twitter_clone/core/core.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;


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
  FutureEither<model.Account> signup({required String email, required String password}) async{
    _account.get();
  }

}