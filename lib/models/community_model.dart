class CommunityModel {
  final String name;
  final String imageUrl;
  final String timeStamp;
  final String message;
  final double liked;
  final int comments;

  CommunityModel({
    required this.name,
    required this.imageUrl,
    required this.timeStamp,
    required this.message,
    required this.liked,
    required this.comments,
  });
}
