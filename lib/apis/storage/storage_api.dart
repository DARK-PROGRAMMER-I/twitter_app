import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';

class StorageApi{
  Storage _storage;
  StorageApi({required Storage storage}) : _storage = storage;

  Future<List<String>> uploadImages(List<File> files){
    try{
      List<String>
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}