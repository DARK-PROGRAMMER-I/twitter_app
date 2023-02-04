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
      _shareImageTweet(
        context: context,
        images: images,
        tweetText: tweetText,
      );
    }else{
      _shareTextTweet(
          tweetText: tweetText,
          context: context,
      );
    }

  }

  // This is when we have both images and text
  _shareImageTweet({
    required List<File> images ,
    required String tweetText,
    required BuildContext context
  }){
  }


  // This is when we have text only and no image
  _shareTextTweet({
    required String tweetText,
    required BuildContext context
  }){
  }

  // Extract HashTags
  List<String> extractHashtTags({required String text}){
    List<String> hashes = [];
    List<String> splittedText = text.split(' ');
    splittedText.forEach((element) {
      if(element.startsWith('#')){
        hashes.add(element);
      }
    });
    return hashes;
  }

  // Extract Links
  List<String> extractLinks({required String text}){
    List<String> links = [];
    List<String> splittedText = text.split(' ');
    splittedText.forEach((element) {
      if(element.startsWith('www.') || element.startsWith('http')){
        links.add(element);
      }
    });
    return links;
  }

}