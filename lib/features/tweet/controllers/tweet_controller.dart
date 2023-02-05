import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/tweet/tweet_api.dart';
import 'package:twitter_clone/core/enums/tweet_type.dart';
import 'package:twitter_clone/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone/models/tweet_models/tweet_model.dart';
import 'package:twitter_clone/utils/utils.dart';

import '../../../apis/storage/storage_api.dart';
import '../../../models/user_models/user_model.dart';

final tweetControllerProvider = StateNotifierProvider<TweetController, bool>((ref) {
  return TweetController(
      ref: ref,
      tweetApi: ref.watch(tweetApiProvider),
      storageApi: ref.watch(storageApiProvider)
  );
});

class TweetController extends StateNotifier<bool>{
  final Ref _ref ;
  final TweetApi _tweetApi ;
  final StorageApi _storageApi ;
  TweetController({required Ref ref, required TweetApi tweetApi, required StorageApi storageApi}) :
        _ref = ref,
        _tweetApi = tweetApi,
        _storageApi = storageApi,
        super(false);

  void shareTweet({
    required List<File> images ,
    required String tweetText,
    required BuildContext context
  }){

    if(tweetText.isEmpty){
      showSnakBar(context, 'Please enter text ... ');
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
  Future<void> _shareImageTweet({
    required List<File> images ,
    required String tweetText,
    required BuildContext context
  })async{
    state = true;
    final List<String> hashtags = _extractHashtTags(text: tweetText);
    final String link = _extractLinks(text: tweetText);
    final user = _ref.watch(currentUserDetailsProvider).value;
    TweetModel tweetModel = TweetModel(
        text: tweetText,
        hashTags: hashtags,
        link: link,
        imageLinks: await _storageApi.uploadImages(images),
        uid: user?.uid ?? '',
        tweetType: TweetType.image,
        tweetAt: DateTime.now(),
        likes: [],
        commentIds: [],
        tweetId: '',
        reshareCount: 0
    );

    final result = await _tweetApi.shareTweet(tweetModel: tweetModel);
    state = false;
    result.fold(
      (l) {
        showSnakBar(context, l.message);
    }, (r){
        showSnakBar(context, 'image based tweet successfull');
    });
  }


  // This is when we have text only and no image
  Future<void> _shareTextTweet({
    required String tweetText,
    required BuildContext context
  })async{
    state = true;
    final List<String> hashtags = _extractHashtTags(text: tweetText);
    final String link = _extractLinks(text: tweetText);
    final UserModel? user = _ref.read(currentUserDetailsProvider).value;
    TweetModel tweetModel = TweetModel(
        text: tweetText,
        hashTags: hashtags,
        link: link,
        imageLinks: [],
        uid: user?.uid ?? '',
        tweetType: TweetType.text,
        tweetAt: DateTime.now(),
        likes: [],
        commentIds: [],
        tweetId: '',
        reshareCount: 0
    );

    final result = await _tweetApi.shareTweet(tweetModel: tweetModel);
    state = false;
    result.fold(
      (l) {
      showSnakBar(context, l.message);
    }, (r) {
        showSnakBar(context, 'Tweeted!');
    });
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
      if(element.startsWith('www') || element.startsWith('http')){
        print(element);
        links = element;
      }
    });
    return links;
  }

}