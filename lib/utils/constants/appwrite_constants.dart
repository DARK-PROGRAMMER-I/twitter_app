class AppwriteConstants {
  static const String databaseId = "63d76c7658e005270d87";
  static const String projectId = "63d769b68ed50129f51b";
  static const String endPoint = "http://192.168.10.10/v1";


  static const String userCollectionId = "63dbc3454c09d7d90a34";
  static const String tweetCollectionId = "63df53915fb0fc22c83e";


  static const String imageBucketId = "63dfa0eb5f81ccf78df4";
  static String generateImageUrl(String id)=>
  '$endPoint/storage/buckets/$imageBucketId/files/$id/view?project=$projectId&mode=admin';
}