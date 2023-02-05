import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:twitter_clone/utils/constants/appwrite_constants.dart';

class StorageApi{
  Storage _storage;
  StorageApi({required Storage storage}) : _storage = storage;

  Future<List<String>> uploadImages(List<File> files)async{
    try{
      List<String> images = [];
      for(File file in files){
        final imageUrl = await _storage.createFile(
            bucketId: AppwriteConstants.imageBucketId,
            fileId: ID.unique(),
            file: InputFile(path: file.path)
        );


      }
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}