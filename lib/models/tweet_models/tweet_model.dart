import 'package:twitter_clone/core/enums/tweet_type.dart';

class TweetModel{
  final String text;
  final List<dynamic> hashTags;
  final String link;
  final List<dynamic> imageLinks;
  final String uid;
  final TweetType tweetType;
  final DateTime tweetAt;
  final List<dynamic> likes;
  final List<dynamic> commentIds;
  final String tweetId;
  final int reshareCount;
  final String retweetedBy;

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
    required this.retweetedBy,
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
          reshareCount == other.reshareCount &&
          retweetedBy == other.retweetedBy );

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
      retweetedBy.hashCode ^
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
        ' retweetedBy: $retweetedBy,' +
        '}';
  }

  TweetModel copyWith({
    String? text,
    List<dynamic>? hashTags,
    String? link,
    List<dynamic>? imageLinks,
    String? uid,
    TweetType? tweetType,
    DateTime? tweetAt,
    List<dynamic>? likes,
    List<dynamic>? commentIds,
    String? tweetId,
    int? reshareCount,
    String? retweetedBy,
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
      retweetedBy: retweetedBy ?? this.retweetedBy,
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
      'retweetedBy': this.retweetedBy,
    };
  }

  factory TweetModel.fromMap(Map<String, dynamic> map) {
    return TweetModel(
      text: map['text'] as String,
      hashTags: map['hashTags'] as List<dynamic>,
      link: map['link'] as String,
      imageLinks: map['imageLinks'] as List<dynamic>,
      uid: map['uid'] as String,
      tweetType: (map['tweetType'] as String).toTweetTypeEnum(),
      tweetAt: DateTime.fromMillisecondsSinceEpoch(map['tweetAt']),
      likes: map['likes'] as List<dynamic>,
      commentIds: map['commentIds'] as List<dynamic>,
      tweetId: map['\$id'] as String,
      reshareCount: map['reshareCount'] as int,
      retweetedBy: map['retweetedBy'] as String,
    );
  }

//</editor-fold>
}