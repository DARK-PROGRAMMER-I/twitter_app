import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/utils/utils.dart';

class TweetController extends StateNotifier<bool>{
  TweetController() : super(false);

  shareTweet({
    required List<File> images ,
    required String tweetText,
    required BuildContext context
  }){
    if(tweetText.isEmpty){
      showSnakBacr(context, 'Please enter text ... ');
    }

    if(images.isNotEmpty){

    }else{

    }

  }

  // This is when we have both images and text
  _shareImageTweet(){

  }

}