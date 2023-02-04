enum TweetType {
  text('text'),
  image('image');

  const TweetType(this.type);
  final String type;
}

extension convertTweet on String{
  TweetType toTweetTypeEnum(){
    switch(this) {
      case 'text':
        return TweetType.text;

      case 'image':
        return TweetType.image;

      default:
        return TweetType.image;
    }
}
}