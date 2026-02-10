class VideoPost {
  final String caption;
  final String videoUrl;
  final int likes;
  final int views;

  VideoPost({
    required this.caption,
    required this.videoUrl,
    this.views = 0,
    this.likes = 0,
  });
}
