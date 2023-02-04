import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

showSnakBacr(BuildContext context, String content){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(content),
    )
  );
}

String getNameFromEmail(String email){
  return email.split('@')[0];
}

Future<List<File>> pickMultipleImages()async{
  List<File> images = [];
  ImagePicker picker = ImagePicker();
  List<XFile> files = await picker.pickMultiImage();
  files.forEach((element) {
    images.add(File(element.path));
  });
  return images;
}