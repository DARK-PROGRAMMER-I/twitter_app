import 'package:twitter_clone/core/enums/tweet_type.dart';

class TweetModel{
  final String text;
  final List<String> hashTags;
  final String link;
  final List<String> imageLinks;
  final String uid;
  final TweetType tweetType;
  final DateTime tweetAt;
  final List<String> likes;
  final List<String> commentIds;
  final String tweetId;
  final int reshareCount;

//<editor-fold desc="Data Methods">
  const TweetModel({
    required this.text,
    required this.hashTags,
    required this.link,
    required this.imageLinks,
    required this.uid,
    required this.tweetType,
    required this.tweetAt,
    required this.likes,
    required this.commentIds,
    required this.tweetId,
    required this.reshareCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TweetModel &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          hashTags == other.hashTags &&
          link == other.link &&
          imageLinks == other.imageLinks &&
          uid == other.uid &&
          tweetType == other.tweetType &&
          tweetAt == other.tweetAt &&
          likes == other.likes &&
          commentIds == other.commentIds &&
          tweetId == other.tweetId &&
          reshareCount == other.reshareCount);

  @override
  int get hashCode =>
      text.hashCode ^
      hashTags.hashCode ^
      link.hashCode ^
      imageLinks.hashCode ^
      uid.hashCode ^
      tweetType.hashCode ^
      tweetAt.hashCode ^
      likes.hashCode ^
      commentIds.hashCode ^
      tweetId.hashCode ^
      reshareCount.hashCode;

  @override
  String toString() {
    return 'TweetModel{' +
        ' text: $text,' +
        ' hashTags: $hashTags,' +
        ' link: $link,' +
        ' imageLinks: $imageLinks,' +
        ' uid: $uid,' +
        ' tweetType: $tweetType,' +
        ' tweetAt: $tweetAt,' +
        ' likes: $likes,' +
        ' commentIds: $commentIds,' +
        ' tweetId: $tweetId,' +
        ' reshareCount: $reshareCount,' +
        '}';
  }

  TweetModel copyWith({
    String? text,
    List<String>? hashTags,
    String? link,
    List<String>? imageLinks,
    String? uid,
    TweetType? tweetType,
    DateTime? tweetAt,
    List<String>? likes,
    List<String>? commentIds,
    String? tweetId,
    int? reshareCount,
  }) {
    return TweetModel(
      text: text ?? this.text,
      hashTags: hashTags ?? this.hashTags,
      link: link ?? this.link,
      imageLinks: imageLinks ?? this.imageLinks,
      uid: uid ?? this.uid,
      tweetType: tweetType ?? this.tweetType,
      tweetAt: tweetAt ?? this.tweetAt,
      likes: likes ?? this.likes,
      commentIds: commentIds ?? this.commentIds,
      tweetId: tweetId ?? this.tweetId,
      reshareCount: reshareCount ?? this.reshareCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': this.text,
      'hashTags': this.hashTags,
      'link': this.link,
      'imageLinks': this.imageLinks,
      'uid': this.uid,
      'tweetType': this.tweetType.type,
      'tweetAt': this.tweetAt.millisecondsSinceEpoch,
      'likes': this.likes,
      'commentIds': this.commentIds,
      'reshareCount': this.reshareCount,
    };
  }

  factory TweetModel.fromMap(Map<String, dynamic> map) {
    return TweetModel(
      text: map['text'] as String,
      hashTags: map['hashTags'] as List<String>,
      link: map['link'] as String,
      imageLinks: map['imageLinks'] as List<String>,
      uid: map['uid'] as String,
      tweetType: (map['tweetType'] as String).toTweetTypeEnum(),
      tweetAt: map['tweetAt'] as DateTime,
      likes: map['likes'] as List<String>,
      commentIds: map['commentIds'] as List<String>,
      tweetId: map['\$id'] as String,
      reshareCount: map['reshareCount'] as int,
    );
  }

//</editor-fold>
}