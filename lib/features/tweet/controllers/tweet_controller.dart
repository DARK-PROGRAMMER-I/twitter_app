import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/utils/utils.dart';

class TweetController extends StateNotifier<bool>{
  final Ref _ref ;
  TweetController({required Ref ref}) :
        _ref = ref,
        super(false);

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
    final List<String> hashtags = _extractHashtTags(text: tweetText);
    final String link = _extractLinks(text: tweetText);
    final String uid =
  }

  // Extract HashTags
  List<String> _extractHashtTags({required String text}){
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
  String _extractLinks({required String text}){
    String links = '';
    List<String> splittedText = text.split(' ');
    splittedText.forEach((element) {
      if(element.startsWith('www.') || element.startsWith('http')){
        links = element;
      }
    });
    return links;
  }

}