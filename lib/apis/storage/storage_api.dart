import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/utils/constants/appwrite_constants.dart';

final storageApiProvider = Provider<StorageApi>((ref) =>
    StorageApi(storage: storage)
);

class StorageApi{
  Storage _storage;
  StorageApi({required Storage storage}) : _storage = storage;

  Future<List<String>> uploadImages(List<File> files)async{
    List<String> images = [];
    for(File file in files){
      final imageUrl = await _storage.createFile(
          bucketId: AppwriteConstants.imageBucketId,
          fileId: ID.unique(),
          file: InputFile(path: file.path)
      );
      images.add(AppwriteConstants.generateImageUrl(imageUrl.$id));
    }

    return images;
  }
}