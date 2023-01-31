

import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/utils/constants/constants.dart';

final appwriteClientProvider = Provider<Client>((ref) {
  Client client = Client();
  return client.setEndpoint(AppwriteConstants.endPoint)
  .setProject(AppwriteConstants.projectId)
  .setSelfSigned(status: true);
});


